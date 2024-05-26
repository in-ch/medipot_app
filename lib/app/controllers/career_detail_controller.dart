import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/services/services.dart';

class CareerDetailController extends GetxController {
  RxBool isLoading = false.obs;

  Hospital defaultHospital = Hospital(
    no: 0,
    createdAt: '',
    updatedAt: '',
    name: 'Default Hospital',
    logo: '',
    location: 'Default Location',
    locationDetail: 'Default Location Detail',
    lat: 0.0,
    lng: 0.0,
    homepage: 'https://example.com',
  );

  Career career = Career.defaultCareer();

  @override
  void onInit() {
    int no = Get.arguments['no'];
    Future.delayed(Duration.zero, () async {
      getCareer(no);
    });
    super.onInit();
  }

  /// [비즈니스 로직]
  /// 커리어 상세 내용을 가져온다.
  Future<dynamic> getCareer(int no) async {
    try {
      isLoading.value = true;
      final response = await CareerService.getCareer(no);
      if (response['statusCode'] == 200) {
        final data = response['data'];
        career = Career.fromJson(data);
        saveRecentCareerItem(
            career.no, career.title, career.hospital.name, career.imgs[0]);
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
  /// 최근에 본 초빙 공고 아이템을 저장한다.
  Future<void> saveRecentCareerItem(
      int no, String title, String hospitalName, String img) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> recentCareerItems =
        prefs.getStringList('recentCareerItems') ?? [];
    // 중복 체크 및 기존 항목 제거
    recentCareerItems.removeWhere((item) {
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
    recentCareerItems.insert(0, newItem);
    // 최대 10개의 아이템만 유지
    if (recentCareerItems.length > 10) {
      recentCareerItems = recentCareerItems.sublist(0, 10);
    }
    await prefs.setStringList('recentCareerItems', recentCareerItems);
  }
}
