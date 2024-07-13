import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/routes/routes.dart';
import 'package:docspot_app/app/views/views.dart';
import 'package:docspot_app/app/controllers/controllers.dart';

class CareerSubPage extends StatefulWidget {
  const CareerSubPage({super.key});

  @override
  State<CareerSubPage> createState() => _CareerSubPageState();
}

class _CareerSubPageState extends State<CareerSubPage> {
  final CareerController controller = Get.put(CareerController());

  bool _isVersionChecked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getCareersInit();
    });
  }

  void _verifyVersionOnce(BuildContext context) {
    if (!_isVersionChecked) {
      _isVersionChecked = true;
      controller.verifyVersion(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    _verifyVersionOnce(context);
    return Theme(
        data: appTheme,
        child: Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ViewByDepartment(),
                  const ShowRecent(),
                  Obx(() => controller.isLoading.value
                      ? const SizedBox(
                          height: 212,
                          child: Center(child: CircularProgressIndicator()))
                      : CareerSlider(careers: controller.careersInit)),
                  const CareerLocations(),
                ],
              ),
            ),
          ),
        ));
  }
}
