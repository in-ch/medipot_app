import 'package:get/get.dart';

class CareerController extends GetxController {
  RxBool isLoading = false.obs;
  RxString locationValue = '전체보기'.obs;
  RxString departmentValue = '전체보기'.obs;

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
}
