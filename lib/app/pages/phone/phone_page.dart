import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';

class PhonePage extends GetView<PhoneController> {
  const PhonePage({super.key});

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
                    "휴대 번호를 입력해주세요.",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "해당 번호로 인증 코드를 보내드립니다.",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
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
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "🇰🇷",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              "  |  ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: Colors.black38),
                            ),
                            Text(
                              "010",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(color: Colors.black38),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 2.0),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
                                  maxLength: 8,
                                  controller: controller.textEditingController,
                                  focusNode: controller.focusNode,
                                  style: const TextStyle(fontSize: 14),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '12345678',
                                    counterText: "",
                                    hintStyle: TextStyle(color: Colors.black38),
                                    fillColor: Colors.transparent,
                                    filled: true,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 30, left: 30.0, right: 30.0),
                      child: Obx(() {
                        return AbsorbPointer(
                          absorbing: !controller.isValid.value,
                          child: GestureDetector(
                              onTap: () => controller.sendValidationCode(),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "인증번호 보내기",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(color: Colors.white),
                                      ),
                                    ],
                                  ))),
                        );
                      })),
                ],
              ))),
    );
  }
}
