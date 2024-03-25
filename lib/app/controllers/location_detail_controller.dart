// ignore_for_file: use_build_context_synchronously

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:medipot_app/services/services.dart';
import 'package:medipot_app/app/views/views.dart';

class LocationDetailController extends GetxController {
  RxBool isLoading = true.obs;

  late final WebViewController webviewController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String webviewLink = dotenv.get("WEBVIEW_SERVER");

  @override
  void onInit() {
    int locationNo = Get.arguments['locationNo'];
    Future.delayed(Duration.zero, () async {
      webviewController = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {},
            onPageStarted: (String url) {
              isLoading.value = true;
            },
            onPageFinished: (String url) {
              isLoading.value = false;
            },
            onWebResourceError: (WebResourceError error) {},
          ),
        )
        ..loadRequest(Uri.parse(
            '$webviewLink/location/detail/$locationNo?isWebview=true'));
    });
    super.onInit();
  }

  /// [Method]
  /// [description] 전화 문의하기
  void makePhoneCall(
    String phoneNumber,
  ) async {
    String url = 'tel:$phoneNumber';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      Get.snackbar("전화 걸기에 실패하였습니다.", "지속 발생 시 관리자에게 문의해주세요.");
    }
  }

  /// [Method]
  /// [description] 프리미엄 리포트 신청하기
  void requestPremiumReport(BuildContext context) async {
    try {
      final response = await UserService.getMe();
      final data = response.data;
      if (data.phone == '') {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return const PhoneValidationModal();
          },
        );
      } else {
        final locationNo = Get.arguments['locationNo'];
        final response = await LocationService.requestPremiumReport(locationNo);
        final statusCode = response;
        if (statusCode == 200) {
          Get.snackbar("프리미엄 리포트 신청이 완료되었습니다.", "영업일 기준 1~2일 내로 리포트가 도착합니다.");
        } else {
          Get.snackbar("서버 문제가 발생하였습니다.", "지속 발생 시 관리자에게 문의해주세요.");
        }
      }
    } catch (error) {
      Get.snackbar("서버 문제가 발생하였습니다.", "지속 발생 시 관리자에게 문의해주세요.");
      rethrow;
    }
  }
}
