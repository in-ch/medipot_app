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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.verifyVersion(context);
      controller.requestDepartmentAndEmail();
      controller.saveFcmToken();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: appTheme,
        child: Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            iconTheme: Theme.of(context).iconTheme,
            centerTitle: false,
            toolbarHeight: 40,
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
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: GoToAlarm(),
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
                  ShowNewAlarms(),
                  ViewByDepartment(),
                  ShowRecent(),
                  CareerLocations(),
                ],
              ),
            ),
          ),
        ));
  }
}
