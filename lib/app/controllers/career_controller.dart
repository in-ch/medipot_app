// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:app_version_update/app_version_update.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/services/services.dart';
import 'package:docspot_app/app/views/views.dart';
import 'package:docspot_app/app/utils/utils.dart';

class CareerController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isRecentLoading = false.obs;
  RxBool hideBottomButton = false.obs;

  RxDouble bodyHeight = 0.0.obs;
  List<CareerListItem> careersInit = []; // 초빙 공고.zip
  RxList<int> likeCareers = <int>[].obs;

  RxList<Map<String, dynamic>> recentCareerItems = <Map<String, dynamic>>[].obs;
  bool _isModalRequestDepartmentOpen = false;
  bool _isModalRequestEmailOpen = false;
  bool _isUpdateOpen = false;

  Timer? _debounceTimer;

  @override
  void onInit() {
    update();
    super.onInit();
  }

  /// [비즈니스 로직]
  /// 지원하기
  Future<dynamic> handleJoin(String contactPhone) async {
    try {
      String url = 'tel:$contactPhone';
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        Get.snackbar("전화 걸기에 실패하였습니다.", "지속 발생 시 관리자에게 문의해주세요.");
      }
    } catch (error) {
      throw Exception(error);
    } finally {
      update();
    }
  }

  /// [비즈니스 로직]
  /// 홈페이지 지원하기
  Future<dynamic> handleHomepageJoin(String careerLink) async {
    try {
      String url = careerLink;
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        Get.snackbar("홈페이지 열기에 실패하였습니다.", "지속 발생 시 관리자에게 문의해주세요.");
      }
    } catch (error) {
      throw Exception(error);
    } finally {
      update();
    }
  }

  void clearBodyHeight() {
    bodyHeight.value = 0;
    update();
  }

  /// [비즈니스 로직]
  /// 좋아요한 초빙 공고 가져오기
  Future<void> getLikeCareers() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLogin = prefs.getBool("isLogin") ?? false;
      likeCareers.value = [];
      if (isLogin) {
        final response = await CareerService.getCareerLikeList();
        if (response['statusCode'] == 200) {
          final data = response['data'] as List;
          likeCareers.assignAll(data.cast<int>());
        }
      }
    } catch (error) {
      debugPrint(error.toString());
    } finally {
      update();
    }
  }

  /// [비즈니스 로직]
  /// 좋아요한 초빙 공고 가져오기 - 인피니티 스크롤링
  Future<void> getLikeCareersInfinite(PagingController pagingController) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLogin = prefs.getBool("isLogin") ?? false;
      likeCareers.value = [];
      if (isLogin) {
        final response = await CareerService.getCareerLikeListInfinite();
        final data = response['data'] as List;
        final list = List<CareerListItem>.from(
            data.map((item) => CareerListItem.fromJson(item)));
        pagingController.appendLastPage(list);
      } else {
        pagingController.error = true;
      }
    } catch (error) {
      debugPrint(error.toString());
    } finally {
      update();
    }
  }

  /// [비즈니스 로직]
  /// 초빙 공고 좋아요
  Future<dynamic> likeCareer(BuildContext context, int careerNo) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLogin = prefs.getBool("isLogin") ?? false;
      if (!isLogin) {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return const PleaseLogin();
          },
        );
      } else {
        final response = await CareerService.careerLike(careerNo);
        final scaffold = ScaffoldMessenger.of(context);
        if (response['statusCode'] == 200) {
          likeCareers.add(careerNo);
          update();
        } else if (response['statusCode'] == 409) {
          showToast(scaffold, '이미 좋아요한 초빙 공고입니다.');
        } else {
          showToast(scaffold, '서버에 오류가 발생하였습니다. 잠시만 기다려주세요.');
          throw Exception('Failed to likeCareer');
        }
      }
    } catch (error) {
      throw Exception(error);
    } finally {
      update();
    }
  }

  /// [비즈니스 로직]
  /// 초빙 공고 좋아요 취소
  Future<dynamic> unlikeCareer(BuildContext context, int careerNo) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLogin = prefs.getBool("isLogin") ?? false;

      if (!isLogin) {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return const PleaseLogin();
          },
        );
      } else {
        final response = await CareerService.careerUnLike(careerNo);
        final scaffold = ScaffoldMessenger.of(context);
        if (response['statusCode'] == 200) {
          likeCareers.remove(careerNo);
          update();
        } else if (response['statusCode'] == 409) {
          showToast(scaffold, '이미 좋아요 취소한 초빙 공고입니다.');
        } else {
          showToast(scaffold, '서버에 오류가 발생하였습니다. 잠시만 기다려주세요.');
          throw Exception('Failed to unlikeCareer');
        }
      }
    } catch (error) {
      throw Exception(error);
    } finally {
      update();
    }
  }

  /// [비즈니스 로직]
  /// 초빙공고.zip 커리어 리스트를 조회한다.
  Future<dynamic> getCareersInit() async {
    try {
      isLoading.value = true;
      final response =
          await CareerService.getCareers(0, 10, '', '', '', '', '', '');
      if (response['statusCode'] == 200) {
        final data = response['data'];
        careersInit = List<CareerListItem>.from(
            data.map((item) => CareerListItem.fromJson(item)));
      }
    } catch (error) {
      debugPrint(error.toString());
      isLoading.value = false;
      update();
    } finally {
      isLoading.value = false;
      update();
    }
  }

  /// [비즈니스 로직]
  /// 최근에 본 초빙 공고 아이템을 불러온다.
  Future<void> getRecentItems() async {
    isRecentLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedRecentCareerItems =
        prefs.getStringList('recentCareerItems') ?? [];

    recentCareerItems.value = savedRecentCareerItems
        .map((item) => jsonDecode(item) as Map<String, dynamic>)
        .toList();
    isRecentLoading.value = false;
    update();
  }

  /// [비즈니스 로직]
  /// 최근에 본 초빙 공고 아이템을 삭제한다.
  Future<void> resetRecentItems(BuildContext context) async {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return ResetRecentCareerList(
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setStringList('recentCareerItems', []);
            recentCareerItems.value = [];
            Navigator.of(context).pop();
            update();
          },
        );
      },
    );
  }

  /// [비즈니스 로직]
  /// 최근에 본 초빙 공고 아이템을 저장한다.
  Future<void> saveRecentCareerItem(
      int no, String title, String hospitalName, String img) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> localRecentCareerItems =
        prefs.getStringList('recentCareerItems') ?? [];
    // 중복 체크 및 기존 항목 제거
    localRecentCareerItems.removeWhere((item) {
      Map<String, dynamic> decodedItem = jsonDecode(item);
      return decodedItem['no'] == no;
    });
    // 새로운 아이템을 맨 앞에 추가
    String newItem = jsonEncode({
      'no': no,
      'title': title,
      'hospitalName': hospitalName,
      'img': img,
    });
    localRecentCareerItems.insert(0, newItem);
    // 최대 10개의 아이템만 유지
    if (localRecentCareerItems.length > 10) {
      localRecentCareerItems = localRecentCareerItems.sublist(0, 10);
    }
    await prefs.setStringList('recentCareerItems', localRecentCareerItems);
    recentCareerItems.value = localRecentCareerItems
        .map((item) => jsonDecode(item) as Map<String, dynamic>)
        .toList();
  }

  /// [비즈니스 로직]
  /// 앱 버전을 확인한 후 강제 업데이트를 실시한다.
  void verifyVersion(BuildContext context) async {
    await AppVersionUpdate.checkForUpdates(
      appleId: dotenv.get("APPLE_APP_ID"),
      playStoreId: dotenv.get("ANDROID_APP_ID"),
      country: 'kr',
    ).then((result) async {
      if (result.canUpdate! && !_isUpdateOpen) {
        _isUpdateOpen = true;
        await AppVersionUpdate.showAlertUpdate(
          appVersionResult: result,
          context: context,
          backgroundColor: Colors.grey[200],
          title: '새로운 업데이트가 발견되었습니다.',
          titleTextStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20.0),
          content: '앱의 업데이트를 진행하시겠습니까?',
          contentTextStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16.0),
          updateButtonText: '업데이트하기',
          updateButtonStyle: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                  const Color.fromARGB(255, 59, 71, 167))),
          mandatory: true,
        );
      }
      _isUpdateOpen = true;
    });
  }

  /// [비즈니스 로직]
  /// 과를 확인해서 진료과가 없으면 진료과를 요청한다.
  /// 이메일도 같이 요청한다.
  Future<void> requestDepartmentAndEmail() async {
    final response = await UserService.me();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (response['statusCode'] == 200) {
      final data = response['data'];
      MeUser user = MeUser.fromJson(data);
      if (user.department == '진료과 없음') {
        if (_isModalRequestDepartmentOpen) return;
        _isModalRequestDepartmentOpen = true;
        await Get.dialog(
          const PleaseDepartmentModal(),
        );
        _isModalRequestDepartmentOpen = false;
      }
      bool hideForDayDate =
          (prefs.getString('hideForEmailRequest') ?? 'false') == 'true';
      if (!EmailValidator.isValidEmail(user.email) && !hideForDayDate) {
        if (_isModalRequestEmailOpen) return;
        _isModalRequestEmailOpen = true;
        await Get.dialog(
          const PleaseInputEmailModal(),
        );
        _isModalRequestEmailOpen = false;
      }
    } else {
      if (_isModalRequestDepartmentOpen) return;
      _isModalRequestDepartmentOpen = true;
      DateTime now = DateTime.now();
      String? savedDate = prefs.getString('hideForDayDate') ?? "2000-01-01";
      DateTime savedDateTime = DateTime.parse(savedDate);
      Duration difference = now.difference(savedDateTime);
      difference.inDays > 0 &&
          await Get.bottomSheet(
            const PleaseLoginAtMain(),
          );
      _isModalRequestDepartmentOpen = false;
    }
  }

  /// [비즈니스 로직]
  /// 유저의 fcmToken을 저장한다.
  Future<void> saveFcmToken() async {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer?.cancel();
    }
    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLogin = prefs.getBool('isLogin') ?? false;
      String fcmToken = prefs.getString("fcmToken")!;

      if (isLogin) {
        await UserService.updateFcmToken(fcmToken);
      } else {
        await DeviceInfoService.insertDeviceInfo(fcmToken);
      }
    });
  }

  /// [비즈니스 로직]
  /// 공유하기
  void onClickShareCourtUrl(int pageNo, String title) {
    final shareCourtUrl = 'https://medi-pots.com/career/de/$pageNo';
    Share.share(
      shareCourtUrl,
      subject: title,
    );
  }
}
