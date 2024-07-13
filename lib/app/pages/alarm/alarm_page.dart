import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/views/views.dart';

class AlarmPage extends GetView<AlarmController> {
  const AlarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        iconTheme: Theme.of(context).iconTheme,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 54,
        leading: const Align(
          alignment: Alignment.centerRight,
          child: CustomBackButton(),
        ),
        title: Text("알림 정보", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : controller.alarms.isNotEmpty
                ? ListView(
                    children: controller.alarms
                        .map(
                          (alarm) => AlarmItem(
                            title: alarm.title,
                            body: alarm.body,
                            page: alarm.page,
                            pageNo: alarm.pageNo,
                            createdAt: alarm.createdAt,
                          ),
                        )
                        .toList(),
                  )
                : SizedBox(
                    width: double.infinity,
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("알림 정보가 없습니다.",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    color: const Color.fromARGB(
                                        255, 126, 126, 126)))
                      ],
                    ),
                  ),
      ),
    );
  }
}
