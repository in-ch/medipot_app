import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';

class GrantModal extends StatelessWidget {
  final ChatController controller = Get.put(ChatController());

  GrantModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              "의사 회원 인증하기",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const SizedBox(height: 20.0),
          GestureDetector(
            onTap: () {
              controller.uploadLicense(context);
            },
            child: CustomPaint(
              painter: DashedBorderBox(),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "면허증 혹은 학생증을 업로드해주세요.",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "민감한 정보는 마킹 등을 통해 가려주세요.",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        "개인정보보호를 위해 인증 완료 후 자료는 전부 삭제됩니다.",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "'인증 완료'까지 1~2일까지 소요될 수 있습니다.",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 10.0, top: 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0, backgroundColor: colorScheme.primary),
                  onPressed: () {
                    controller.uploadLicense(context);
                  },
                  child: Obx(() => controller.isLicenseUploadLoading.value
                      ? const Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Text('업로드하기',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.white)))),
            ),
          ),
          const SizedBox(height: 40.0),
        ],
      ),
    );
  }
}
