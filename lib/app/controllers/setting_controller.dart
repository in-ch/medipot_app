import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medipot_app/data/models/models.dart';
import 'package:medipot_app/services/services.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:medipot_app/app/pages/pages.dart';

class SettingController extends GetxController {
  RxBool isLoading = false.obs;

  late MeUser user;

  /// [비즈니스 로직]
  /// 로그아웃
  Future<void> logout(context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', false);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => const HomePage(),
      ),
    );
  }

  @override
  void onInit() {
    getMyData();
    super.onInit();
  }

  // /// [비즈니스 로직]
  // /// 유저 정보를 조회한다.
  Future<void> getMyData() async {
    try {
      isLoading.value = true;
      final response = await UserService.getMe();
      final data = response.data;
      user = data;
      isLoading.value = false;
      update();
    } catch (error) {
      print(error);
      isLoading.value = false;
      update();
    }
  }
}
