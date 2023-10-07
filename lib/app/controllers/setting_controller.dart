import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:medipot_app/data/models/models.dart';
import 'package:medipot_app/services/services.dart';
import 'package:medipot_app/app/pages/pages.dart';
import 'package:medipot_app/app/utils/utils.dart';

class SettingController extends GetxController {
  RxBool isLoading = false.obs;
  RxString selectedReason = '탈퇴 후 재가입을 위해서'.obs; // RxString으로 변경
  RxBool isAgreeDeleteAccount = false.obs;

  late MeUser user;

  /// [변수]
  /// 탈퇴 사유 options
  final List<String> reasons = [
    '탈퇴 후 재가입을 위해서',
    '사용성이 떨어져서',
    '원하는 정보가 없어서',
    '더 이상 이용하지 않을 거라서',
    '기타'
  ];

  @override
  void onInit() {
    getMyData();
    super.onInit();
  }

  /// [비즈니스 로직]
  /// 탈퇴 사유 변경 로직
  void handleChangeSelectedReason(String? newValue) {
    selectedReason.value = newValue ?? ''; // RxString 값 업데이트
    update();
  }

  /// [비즈니스 로직]
  /// 탈퇴에 동의합니다. 클릭 이벤트
  void handleChangeDeleteAgree() {
    isAgreeDeleteAccount.value = !isAgreeDeleteAccount.value;
    update();
  }

  /// [비즈니스 로직]
  /// 회원 탈퇴 클릭 이벤트
  void handleSubmitDeleteAccount(BuildContext context, String text) async {
    final scaffold = ScaffoldMessenger.of(context);
    try {
      if (text == '') {
        showToast(scaffold, '탈퇴 사유를 입력해주세요.');
      } else if (!isAgreeDeleteAccount.value) {
        showToast(scaffold, '탈퇴에 동의해주세요.');
      } else {
        bool response = await UserService.deleteAccount();
        if (response) {
          Get.offAll(const HomePage());
          Get.snackbar("삭제 완료", "계정의 삭제가 완료되었습니다.");
        } else {
          showToast(scaffold, "이미 삭제된 유저이거나 서버에 문제가 발생하였습니다.");
        }
      }
    } catch (e) {
      showToast(scaffold, "서버에 문제가 발생하였습니다.");
    }
  }

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
      isLoading.value = false;
      update();
    }
  }
}
