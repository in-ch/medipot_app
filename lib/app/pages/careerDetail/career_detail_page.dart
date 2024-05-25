import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';

class CareerDetailPage extends GetView<CareerDetailController> {
  const CareerDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: appTheme,
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
                  ),
                  CareerInfoCard(
                    career: controller.career,
                  ),
                  CareerCardBottom(careerNo: controller.career.no)
                ],
              );
            }
          }),
        ));
  }
}
