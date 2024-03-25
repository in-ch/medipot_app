// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:get/get.dart';

import 'package:medipot_app/app/pages/pages.dart';
import 'package:medipot_app/services/services.dart';

class LoginController extends GetxController {
  /// [Method]
  /// [description] 카카오 로그인
  Future<void> kakaoLogin(BuildContext context) async {
    if (await isKakaoTalkInstalled()) {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
        await LoginService.kakaoLoginApi(token.accessToken);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => const HomePage(),
          ),
        );
      } catch (error) {
        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
          await LoginService.kakaoLoginApi(token.accessToken);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => const HomePage(),
            ),
          );
        } catch (error) {
          Get.snackbar("로그인 실패", "카카오톡 로그인에 실패하였습니다.");
        }
      }
    } else {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        await LoginService.kakaoLoginApi(token.accessToken);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => const HomePage(),
          ),
        );
      } catch (error) {
        Get.snackbar("로그인 실패", "카카오톡 로그인에 실패하였습니다.");
      }
    }
  }
}
