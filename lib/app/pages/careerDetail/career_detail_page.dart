import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';
import 'package:docspot_app/app/utils/utils.dart';

class CareerDetailPage extends GetView<CareerDetailController> {
  const CareerDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: appTheme,
        child: PopScope(
          canPop: true,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    CareerDetailSlider(imageUrls: controller.career.imgs),
                    CareerCardHeader(
                        hospitalName: controller.career.hospital.name,
                        contentNo: controller.career.no,
                        text: controller.career.title),
                    CareerInfoCard(
                      career: controller.career,
                    ),
                    CareerCardBottom(
                        careerNo: controller.career.no,
                        careerPhone: controller.career.contactPhone,
                        isExpired:
                            calculateDday(controller.career.deadline) == '마감'
                                ? true
                                : false,
                        careerLink: controller.career.link)
                  ],
                );
              }
            }),
          ),
        ));
  }
}
