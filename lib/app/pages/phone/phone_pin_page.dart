import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:medipot_app/app/controllers/controllers.dart';
import 'package:medipot_app/app/style/theme.dart';
import 'package:medipot_app/app/views/views.dart';

class PhonePinPage extends GetView<PhoneController> {
  const PhonePinPage({Key? key}) : super(key: key);

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
              leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  CupertinoIcons.back,
                  color: Colors.black87,
                ),
              ),
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
                    "인증 번호를 입력해주세요.",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "010-1234-5667로 인증 번호를 보냈습니다.",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 25),
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [PinCodeInput()]),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 45, left: 30.0, right: 30.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
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
                                "인증하기",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              ))),
    );
  }
}
