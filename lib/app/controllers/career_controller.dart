import 'package:get/get.dart';

import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/services/services.dart';

class CareerController extends GetxController {
  RxBool isLoading = false.obs;
  RxString locationValue = '전체보기'.obs;
  RxString departmentValue = '전체보기'.obs;
  RxBool hideBottomButton = false.obs;

  RxDouble bodyHeight = 0.0.obs;

  List<Career> careers = [];

  List<String> locationList = [
    '전체보기',
    '서울',
    '경기도',
    '인천',
    '부산',
    '대구',
    '광주',
    '강원도',
    '대전',
    '충청북도',
    '충청남도',
    '전라북도',
    '전라남도',
    '제주도'
  ];

  List<String> departmentList = [
    '전체보기',
    '가정의학과',
    '내과',
    '비뇨의학과',
    '산부인과',
    '성형외과',
    '소아청소년과',
    '신경과',
    '신경외과',
    '안과',
    '영상의학과',
    '외과',
    '이비인후과',
    '재활의학과',
    '정신과',
    '정형외과',
    '마취통증의학과',
    '피부과',
    '치과',
    '한의원',
    '종합 병원',
  ];

  /// [비즈니스 로직]
  /// 지원하기
  Future<dynamic> handleJoin() async {
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
  Future<dynamic> handleBookmark() async {
    try {
      Get.snackbar("초빙공고 북마크", "해당 공고를 관심 목록에 저장하였습니다.");
    } catch (error) {
      throw Exception(error);
    } finally {
      update();
    }
  }

  /// [비즈니스 로직]
  /// 커리어 리스트를 조회한다.
  Future<dynamic> getCareers() async {
    try {
      isLoading.value = true;
      final response = await CareerService.getCareers();
      if (response['statusCode'] == 200) {
        final data = response['data'];
        careers = List<Career>.from(data.map((item) => Career.fromJson(item)));
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
