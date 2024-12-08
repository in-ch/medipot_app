import 'package:flutter/material.dart';
import 'package:app_links/app_links.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:docspot_app/app/routes/routes.dart';
import 'package:docspot_app/services/services.dart';

class AppInit {
  /// [비즈니스 로직]
  /// access_token을 검증 후 필요 시 리프레쉬 실행
  static Future<void> tokenCheck() async {
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

  /// [비즈니스 로직]
  /// 앱 링크 이벤트
  static void uriLinkListen() async {
    final appLinks = AppLinks();
    appLinks.uriLinkStream.listen((uri) {
      if (uri.toString().contains('career')) {
        final lastSegment = uri.pathSegments.last;
        final no = int.tryParse(lastSegment);
        if (no != null) {
          Get.toNamed(Routes.careerDetail, arguments: {'no': no});
        } else {
          debugPrint('Failed to parse "no" as an integer.');
        }
      }
    }, onError: (error) {
      debugPrint('Error occurred in uriLinkStream: $error');
    });
  }
}
