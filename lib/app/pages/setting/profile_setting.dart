// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';

class ProfileSettingPage extends GetView<SettingController> {
  const ProfileSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: appTheme,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: Theme.of(context).iconTheme,
            centerTitle: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leadingWidth: 54,
            leading: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                  child: const Icon(CupertinoIcons.back),
                  onTap: () {
                    controller.resetPreviewImage();
                    Navigator.of(context).pop();
                  }),
            ),
            title: Obx(
              () => controller.isLoading.value
                  ? Text("로딩 중...",
                      style: Theme.of(context).textTheme.headlineMedium)
                  : SizedBox(
                      width: 200,
                      child: Text(
                          controller.user.nickname.length > 10
                              ? '${controller.user.nickname.substring(0, 10)}...'
                              : controller.user.nickname,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headlineMedium),
                    ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20.0),
            child: Obx(
              () => controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: controller.image != null
                                  ? BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: FileImage(
                                            File(controller.image!.path)),
                                      ),
                                    )
                                  : BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          controller.user.profile,
                                        ),
                                      ),
                                    ),
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                                onTap: () {
                                  controller.updateProfileImg();
                                },
                                child: Text("변경",
                                    style: appTheme.textTheme.titleSmall)),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 50.0,
                                  right: 50.0,
                                  top: 10.0,
                                  bottom: 20.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("닉네임",
                                        style: appTheme.textTheme.titleMedium),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      height: 70,
                                      child: TextField(
                                        maxLength: 20,
                                        controller: TextEditingController(
                                            text: controller.user.nickname),
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.all(
                                              10), // 내부 여백 설정
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                4.0), // border-radius 설정
                                            borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 1.0), // border 스타일 설정
                                          ),
                                        ),
                                        onChanged: (value) {
                                          controller
                                              .handleChangeNickname(value);
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 40,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          bool isDone =
                                              await controller.updateProfile();
                                          if (isDone) Navigator.pop(context);
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  colorScheme.primary),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        child: const Text(
                                          '수정하기',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        ));
  }
}
