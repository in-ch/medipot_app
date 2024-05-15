import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/routes/routes.dart';
import 'package:docspot_app/app/views/views.dart';

class CareerPage extends GetView<CareerController> {
  const CareerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: appTheme,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: Theme.of(context).iconTheme,
            centerTitle: false,
            backgroundColor: Colors.white,
            elevation: 0,
            leadingWidth: 54,
            title: Image.asset(
              'assets/image/logo_text.png',
              width: 70,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Center(
                  child: GestureDetector(
                      child: const Icon(CupertinoIcons.search, size: 24.0),
                      onTap: () {
                        Get.toNamed(Routes.search);
                      }),
                ),
              ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Center(
                  child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.alarm);
                      },
                      child: const Icon(CupertinoIcons.bell, size: 24.0)),
                ),
              ),
            ],
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: const SingleChildScrollView(
              child: Column(
                children: [
                  ViewByDepartment(),
                  ShowRecent(),
                  CareerSlider(imageUrls: [
                    'https://cdn.pixabay.com/photo/2024/04/13/18/22/barberry-8694277_1280.jpg',
                    'https://cdn.pixabay.com/photo/2024/03/30/04/56/tea-8664063_1280.jpg',
                    'https://cdn.pixabay.com/photo/2024/04/20/11/47/ai-generated-8708404_1280.jpg',
                    'https://cdn.pixabay.com/photo/2023/06/22/07/13/soil-8080788_1280.jpg'
                  ]),
                  CareerLocations(),
                ],
              ),
            ),
          ),
        ));
  }
}
