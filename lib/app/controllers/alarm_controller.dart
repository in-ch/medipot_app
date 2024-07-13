import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/services/services.dart';

class AlarmController extends GetxController {
  RxBool isLoading = false.obs;

  List<Alarm> alarms = [];

  @override
  void onInit() async {
    await getAlarms();
    super.onInit();
  }

  /// [비즈니스 로직]
  /// 이벤트를 조회한다.
  Future<dynamic> getAlarms() async {
    try {
      isLoading.value = true;
      final response = await AlarmService.getAlarms();
      if (response['statusCode'] == 200) {
        final data = response['data'];
        alarms = List<Alarm>.from(data.map((item) => Alarm.fromJson(item)));
      }
    } catch (error) {
      debugPrint(error.toString());
      isLoading.value = false;
      update();
    } finally {
      isLoading.value = false;
      update();
    }
  }
}
