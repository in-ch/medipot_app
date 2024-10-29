// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/pages/pages.dart';
import 'package:docspot_app/services/services.dart';
import 'package:docspot_app/app/utils/utils.dart';

class LoginController extends GetxController {
  /// [Method]
  /// [description] 카카오 로그인
  Future<void> kakaoLogin(BuildContext context) async {
    if (await isKakaoTalkInstalled()) {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
        await LoginService.loginApi(token.accessToken);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        String fcmToken = prefs.getString("fcmToken")!;
        await UserService.updateFcmToken(fcmToken);

        Get.offAll(() => const HomePage(), binding: BindingsBuilder(() {
          Get.put(HomeController()).getMsgCount();
        }));
      } catch (error) {
        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
          await LoginService.loginApi(token.accessToken);
          Get.offAll(() => const HomePage(), binding: BindingsBuilder(() {
            Get.put(HomeController()).getMsgCount();
          }));
        } catch (error) {
          Get.snackbar("로그인 실패", "카카오톡 로그인에 실패하였습니다.");
        }
      }
    } else {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        await LoginService.loginApi(token.accessToken);

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        String fcmToken = prefs.getString("fcmToken")!;
        await UserService.updateFcmToken(fcmToken);
        Get.offAll(() => const HomePage(), binding: BindingsBuilder(() {
          Get.put(HomeController()).getMsgCount();
        }));
      } catch (error) {
        Get.snackbar("로그인 실패", "카카오톡 로그인에 실패하였습니다.");
      }
    }
  }

  /// [Method]
  /// [description] 애플 로그인
  Future<void> appleLogin(BuildContext context) async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      if (credential.authorizationCode == '') {
        Get.snackbar("애플 로그인 실패", "인증 정보를 확인할 수가 없습니다.");
      } else {
        String identityToken = credential.identityToken as String;
        Map<String, dynamic> decodedToken = decodeJwt(identityToken);
        await LoginService.appleLoginApi(
            identityToken, decodedToken["email"], identityToken);

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        String fcmToken = prefs.getString("fcmToken")!;
        await UserService.updateFcmToken(fcmToken);
        Get.offAll(() => const HomePage(), binding: BindingsBuilder(() {
          Get.put(HomeController()).getMsgCount();
        }));
      }
    } catch (e) {
      Get.snackbar("로그인 실패", "애플 로그인에 실패하였습니다.");
    }
  }
}
