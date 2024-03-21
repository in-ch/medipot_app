import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:medipot_app/app/routes/routes.dart';
import 'package:medipot_app/services/services.dart';

class PhoneController extends GetxController {
  RxBool isValid = false.obs;
  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void onInit() async {
    focusNode.requestFocus();

    textEditingController.addListener(() {
      final inputValue = textEditingController.text;
      if (inputValue.length == 8 && int.tryParse(inputValue) != null) {
        isValid.value = true;
      } else {
        isValid.value = false;
      }
    });
    super.onInit();
  }

  /// [Method]
  /// 인증 코드를 보낸다.
  void sendValidationCode() async {
    String phone = "010${textEditingController.text}";
    bool isOk = await UserService.sendValidationCode(phone);
    if (isOk) {
      Get.snackbar("인증 번호를 보냈습니다.", '인증 번호를 입력해주세요.');
      Get.toNamed(Routes.phonePin,
          arguments: {'phone': textEditingController.text});
    } else {
      Get.snackbar("서버 오류가 발생하였습니다.", "지속 발생 시 관리자에게 문의해주세요.");
    }
  }

  @override
  void onClose() {
    textEditingController.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
