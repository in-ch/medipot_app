import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:medipot_app/app/routes/routes.dart';
import 'package:medipot_app/services/services.dart';

class PhoneController extends GetxController {
  RxBool isValid = false.obs;
  RxBool isValidPin = false.obs;
  RxBool isLoading = false.obs;

  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();

  late List<FocusNode> focusPinNodes;
  late List<TextEditingController> pinControllers;

  @override
  void onInit() async {
    focusNode.requestFocus();
    isLoading.value = false;
    textEditingController.addListener(() {
      final inputValue = textEditingController.text;
      if (inputValue.length == 8 && int.tryParse(inputValue) != null) {
        isValid.value = true;
      } else {
        isValid.value = false;
      }
    });

    focusPinNodes = List.generate(6, (index) => FocusNode());
    pinControllers = List.generate(6, (index) => TextEditingController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusPinNodes[0].requestFocus();
    });

    pinControllers[5].addListener(() {
      if (pinControllers[5].text != '') {
        isValidPin.value = true;
      } else {
        isValidPin.value = false;
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

  void validate() async {
    isLoading.value = true;
    String code = '';
    String phone = "010${textEditingController.text}";

    for (var controller in pinControllers) {
      code = code + controller.text;
    }
    bool isOk = await UserService.validationCode(code, phone);
    if (isOk) {
      Get.back();
      Get.back();
      Get.back();
      Future.delayed(const Duration(milliseconds: 500), _backToDetail);
    } else {
      Get.snackbar("인증에 실패하였습니다.", "인증 번호를 다시 입력해주세요.");
    }
    isLoading.value = false;
  }

  void _backToDetail() {
    Get.snackbar("해당 휴대번호로 인증에", "성공하였습니다.");
  }

  @override
  void onClose() {
    pinControllers[5].dispose();
    isValid.value = false;
    isValidPin.value = false;
    isLoading.value = false;
    super.onClose();
  }
}
