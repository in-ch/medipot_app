import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';

class CareerCardBottom extends GetView<CareerController> {
  const CareerCardBottom(
      {super.key,
      required this.careerNo,
      required this.careerPhone,
      required this.isExpired,
      required this.careerLink});

  final int careerNo;
  final String careerPhone;
  final String careerLink;
  final bool isExpired;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Obx(() => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: controller.hideBottomButton.value ? 91 : 0,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const Hr(),
                Container(
                  color: Colors.white,
                  height: 90,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(width: 20),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: SimpleButton(
                            text: "",
                            isBookmark: true,
                            color: Colors.white,
                            textColor: Colors.white,
                            isActive: controller.likeCareers.contains(careerNo),
                            event: () {
                              controller.likeCareers.contains(careerNo)
                                  ? controller.unlikeCareer(context, careerNo)
                                  : controller.likeCareer(context, careerNo);
                            }),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: isExpired
                            ? SimpleButton(
                                text: "마감된 공고입니다.",
                                color: const Color.fromARGB(115, 59, 59, 59),
                                textColor: Colors.white,
                                event: () {})
                            : careerLink != ""
                                ? SimpleButton(
                                    text: "홈페이지 지원",
                                    color: colorScheme.primary,
                                    textColor: Colors.white,
                                    event: () {
                                      controller.handleHomepageJoin(careerLink);
                                    })
                                : SimpleButton(
                                    text: "지원하기",
                                    color: colorScheme.primary,
                                    textColor: Colors.white,
                                    event: () {
                                      controller.handleJoin(careerPhone);
                                    }),
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
