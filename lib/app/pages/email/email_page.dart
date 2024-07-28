import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';

class EmailPage extends GetView<EmailController> {
  const EmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appTheme,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: const CustomBackButton(),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                "이메일을 입력해주세요.",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 10),
              Text(
                "해당 이메일로 인증 코드를 보내드립니다.",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 235, 235, 235),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Obx(
                          () => TextField(
                            keyboardType: TextInputType.emailAddress,
                            enabled: !controller.isSendEmailCode.value,
                            controller: controller.emailEditingController,
                            focusNode: controller.emailFocusNode,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'example@example.com',
                              hintStyle: TextStyle(color: Colors.black38),
                              fillColor: Colors.transparent,
                              filled: true,
                            ),
                            onChanged: (value) {
                              controller.validateEmail(value);
                            },
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 30, left: 30.0, right: 30.0),
                child: Obx(() {
                  return controller.isSendEmailCode.value
                      ? Column(
                          children: [
                            /// vvvv
                            Container(
                              width: double.infinity,
                              height: 50,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 235, 235, 235),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child: Obx(
                                      () => TextField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                        enabled:
                                            controller.isSendEmailCode.value,
                                        controller: controller
                                            .emailCodeEditingController,
                                        focusNode:
                                            controller.emailCodeFocusNode,
                                        style: const TextStyle(fontSize: 14),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '000000',
                                          hintStyle:
                                              TextStyle(color: Colors.black38),
                                          fillColor: Color.fromARGB(
                                              255, 235, 235, 235),
                                          filled: true,
                                        ),
                                        onChanged: (value) {
                                          controller.validateEmailCode(value);
                                        },
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            AbsorbPointer(
                              absorbing: !controller.isValidCode.value,
                              child: GestureDetector(
                                onTap: () => controller
                                    .compareValidateEmailCode(context),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: controller.isValidCode.value
                                        ? colorScheme.primary
                                        : Colors.black38,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 45,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "인증하기",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      : AbsorbPointer(
                          absorbing: !controller.isValid.value,
                          child: GestureDetector(
                            onTap: () => controller.sendValidationEmailCode(),
                            child: Container(
                              decoration: BoxDecoration(
                                color: controller.isValid.value
                                    ? colorScheme.primary
                                    : Colors.black38,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              width: double.infinity,
                              height: 45,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "인증 코드 보내기",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
