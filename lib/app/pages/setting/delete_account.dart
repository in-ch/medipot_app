// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';

class DeleteAccountPage extends GetView<SettingController> {
  DeleteAccountPage({super.key});

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: appTheme,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              scrolledUnderElevation: 0,
              iconTheme: Theme.of(context).iconTheme,
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              leadingWidth: 54,
              leading: const Align(
                  alignment: Alignment.centerRight, child: CustomBackButton()),
              title: SizedBox(
                width: 200,
                child: Text("탈퇴하기",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineMedium),
              )),
          body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('''회원 탈퇴 전,
아래 내용을 꼭 확인해주세요.
                  ''',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineSmall),
                  Text('''1. 회원 탈퇴 시, 현재 로그인된 아이디는 즉시 탈퇴 처리됩니다.
2. 탈퇴 시 회원 정보 및 등록한 게시물, 서비스 등은 모두 삭제됩니다.
3. 회원 정보 및 서비스 이용 기록은 모두 삭제되며, 삭제된 데이터는 
    복구되지 않습니다.
                  ''',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 20),
                  Text('탈퇴 사유',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 10),
                  Obx(() {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: DropdownButton<String>(
                          value: controller.selectedReason.value,
                          onChanged: (String? newValue) {
                            controller.handleChangeSelectedReason(newValue);
                          },
                          underline: const SizedBox(),
                          items: controller.reasons.map((reason) {
                            return DropdownMenuItem<String>(
                              value: reason,
                              child: Text(reason,
                                  style: Theme.of(context).textTheme.bodySmall),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 10), // 간격을 조절하기 위해 추가
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                      child: TextField(
                        controller: textEditingController,
                        style: const TextStyle(
                          fontSize: 12.0, // 입력되는 텍스트의 폰트 크기를 12px로 설정
                        ),
                        decoration: const InputDecoration(
                          hintText: '더 자세한 내용을 입력해주세요',
                          border: InputBorder.none, // 보더 없음
                          hintStyle: TextStyle(
                            color: Colors.black38,
                            fontSize: 11.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(() {
                    return Row(
                      children: [
                        Checkbox(
                          value: controller.isAgreeDeleteAccount.value,
                          onChanged: (bool? newValue) {
                            controller.handleChangeDeleteAgree();
                          },
                        ),
                        GestureDetector(
                            onTap: () {
                              controller.handleChangeDeleteAgree();
                            },
                            child: const Text('탈퇴에 동의합니다')),
                      ],
                    );
                  }),
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.handleSubmitDeleteAccount(
                            context, textEditingController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                        minimumSize: const Size(double.infinity, 50),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: const Text(
                        '회원 탈퇴',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50)
                ],
              )),
        ));
  }
}
