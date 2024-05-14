import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';

class CareerCardBottom extends GetView<CareerController> {
  const CareerCardBottom({super.key});

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
                            event: () {}),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: SimpleButton(
                            text: "지원하기",
                            color: colorScheme.primary,
                            textColor: Colors.white,
                            event: () {}),
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
