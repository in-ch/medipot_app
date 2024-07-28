import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:docspot_app/services/services.dart';

class EmailController extends GetxController {
  RxBool isValid = false.obs;
  RxBool isValidCode = false.obs;

  RxBool isSendEmailCode = false.obs;

  final emailFocusNode = FocusNode();
  final emailCodeFocusNode = FocusNode();
  final emailEditingController = TextEditingController();
  final emailCodeEditingController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    emailFocusNode.requestFocus();
  }

  @override
  void onClose() {
    emailEditingController.dispose();
    emailCodeEditingController.dispose();
    emailFocusNode.dispose();
    emailCodeFocusNode.dispose();
    super.onClose();
  }

  /// 이메일 유효성 검사 메서드
  void validateEmail(String email) {
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      caseSensitive: false,
    );

    // 이메일 주소가 정규 표현식과 일치하는지 검사
    final isEmailValid = emailRegExp.hasMatch(email);
    // 특정 도메인 차단
    const blockedDomain = 'privaterelay.appleid.com';
    final emailDomain = email.split('@').last;

    // 이메일 유효성 및 도메인 검사
    isValid.value = isEmailValid && emailDomain != blockedDomain;
  }

  /// [Method]
  /// 인증 코드를 비교한다.
  void validateEmailCode(String code) {
    if (code.length == 6) {
      isValidCode.value = true;
    } else {
      isValidCode.value = false;
    }
  }

  /// [Method]
  /// 인증 코드 보내기 메서드
  Future<void> sendValidationEmailCode() async {
    if (isValid.value) {
      final email = emailEditingController.text;
      bool result = await UserService.sendVerificationEmailCode(email);
      if (result) {
        Get.snackbar(
          '인증 코드 전송',
          '인증 코드가 $email로 전송되었습니다.',
          snackPosition: SnackPosition.BOTTOM,
        );
        isSendEmailCode.value = true;
        emailCodeFocusNode.requestFocus();
      } else {
        Get.snackbar(
          '오류',
          '유효하지 않은 주소 혹은 중복된 주소입니다.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      Get.snackbar(
        '오류',
        '유효하지 않은 이메일 주소입니다.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> compareValidateEmailCode(BuildContext context) async {
    if (isValidCode.value) {
      bool result = await UserService.compareValidateEmailCode(
          emailEditingController.value.text,
          emailCodeEditingController.value.text);
      if (result) {
        await UserService.updateEmail(emailEditingController.value.text);
        Get.snackbar("인증 완료", "이메일 변경에 성공하였습니다.");
        Navigator.of(context).pop(true);
      } else {
        Get.snackbar(
          '오류',
          '유효하지 않은 인증 코드입니다.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      Get.snackbar(
        '오류',
        '유효하지 않은 인증 코드입니다.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
