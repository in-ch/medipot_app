import 'package:docspot_app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppInit {
  /// [비즈니스 로직]
  /// access_token을 검증 후 필요 시 리프레쉬 실행
  static void tokenCheck() async {
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
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
