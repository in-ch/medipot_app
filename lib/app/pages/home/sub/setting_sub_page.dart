import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:medipot_app/app/controllers/controllers.dart';
import 'package:medipot_app/app/style/theme.dart';
import 'package:medipot_app/app/views/views.dart';

class SettingSubPage extends StatefulWidget {
  const SettingSubPage({Key? key}) : super(key: key);

  @override
  State<SettingSubPage> createState() => _SettingSubPageState();
}

class _SettingSubPageState extends State<SettingSubPage> {
  final SettingController settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appTheme,
      child: SafeArea(
        child: Scaffold(
            body: Column(
          children: [
            Column(
              children: [
                SettingBoxItem(
                    title: '프로필 수정',
                    description: '닉네임 및 프로필 사진을 변경할 수 있습니다.',
                    backgroundColor: const Color.fromARGB(255, 226, 226, 226),
                    event: () {
                      print('클릭');
                    }),
                SettingBoxItem(
                    title: '이벤트 확인하기',
                    description: '진행 중인 다양한 이벤트를 확인해보세요.',
                    backgroundColor: const Color.fromARGB(255, 226, 226, 226),
                    event: () {
                      print('클릭');
                    }),
                SettingBoxItem(
                    title: '개인정보처리방침',
                    description: '개인정보처리방침을 확인할 수 있습니다.',
                    backgroundColor: const Color.fromARGB(255, 226, 226, 226),
                    event: () {
                      print('클릭');
                    }),
                SettingBoxItem(
                    title: '이용약관',
                    description: '이용약관을 확인할 수 있습니다.',
                    backgroundColor: const Color.fromARGB(255, 226, 226, 226),
                    event: () {
                      print('클릭');
                    }),
                SettingBoxItem(
                    title: '로그아웃',
                    description: '로그인 시 더 다양한 기능을 확인할 수 있습니다.',
                    backgroundColor: const Color.fromARGB(255, 226, 226, 226),
                    event: () {
                      settingController.logout(context);
                    }),
                SettingBoxItem(
                    title: '탈퇴하기',
                    description: '탈퇴 시 기능이 제한될 수 있습니다.',
                    backgroundColor: const Color.fromARGB(255, 226, 226, 226),
                    event: () {
                      print('클릭');
                    }),
                SettingBoxItem(
                    title: '앱 버전',
                    description: 'v1.0.1',
                    backgroundColor: const Color.fromARGB(255, 226, 226, 226),
                    event: () {
                      print('클릭');
                    }),
              ],
            )
          ],
        )),
      ),
    );
  }
}
