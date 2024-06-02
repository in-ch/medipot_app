import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_version_update/app_version_update.dart';

import 'package:docspot_app/services/services.dart';

class MapController extends GetxController {
  RxBool isLoading = false.obs;

  /// [비즈니스 로직]
  /// access_token을 검증 후 필요 시 리프레쉬 실행
  Future<bool> tokenCheck() async {
    try {
      final response = await UserService.me();
      final data = response['data'];
      if (data == null) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        bool isLogin = prefs.getBool('isLogin') ?? false;
        if (isLogin) {
          await UserService.refresh();
        } else {
          prefs.setString('nickname', "");
          prefs.setString('userNo', "");
          prefs.setString('phone', "");
          prefs.setString('accessToken', "");
          prefs.setString('refreshToken', "");
          prefs.setBool('isLogin', false);
        }
      }
      return true;
    } catch (error) {
      return false;
    }
  }

  /// [비즈니스 로직]
  /// 앱 버전을 확인한 후 강제 업데이트를 실시한다.
  void verifyVersion(BuildContext context) async {
    await AppVersionUpdate.checkForUpdates(
      appleId: "6480370775",
      playStoreId: "com.inch.medipot_app",
      country: 'kr',
    ).then((result) async {
      if (result.canUpdate!) {
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
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 59, 71, 167))),
          mandatory: true,
        );
      }
    });
  }
}
