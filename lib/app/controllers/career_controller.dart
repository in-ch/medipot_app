import 'package:get/get.dart';

import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/services/services.dart';

class CareerController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool hideBottomButton = false.obs;

  RxDouble bodyHeight = 0.0.obs;
  List<Career> careersInit = []; // 초빙 공고.zip

  /// [비즈니스 로직]
  /// 지원하기
  Future<dynamic> handleJoin(int careerNo) async {
    try {
      Get.snackbar("문의가 완료되었습니다.", "담당자가 연락올 때까지 잠시만 기다려주세요.");
    } catch (error) {
      throw Exception(error);
    } finally {
      update();
    }
  }

  /// [비즈니스 로직]
  /// 초빙 공고 북마크
  Future<dynamic> handleBookmark(int careerNo) async {
    try {
      Get.snackbar("초빙공고 북마크", "해당 공고를 관심 목록에 저장하였습니다.");
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
          await CareerService.getCareers(0, 10, '', '', '', '', '');
      if (response['statusCode'] == 200) {
        final data = response['data'];
        careersInit =
            List<Career>.from(data.map((item) => Career.fromJson(item)));
      }
    } catch (error) {
      print(error);
      isLoading.value = false;
      update();
    } finally {
      isLoading.value = false;
      update();
    }
  }
}
