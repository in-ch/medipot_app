import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/services/services.dart';
import 'package:docspot_app/app/utils/utils.dart';

class AlarmController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool hasUnreadAlarm = false.obs; // 읽지 않은 알림 여부를 저장하는 변수 추가

  List<Alarm> alarms = [];

  @override
  void onInit() async {
    await checkUnreadAlarms();
    await getAlarms();
    super.onInit();
  }

  /// 알림을 가져오는 비즈니스 로직
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

  /// 안 읽은 알림이 있는지 확인하는 비즈니스 로직
  Future<void> checkUnreadAlarms() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool('isLogin') ?? false;

    final String currentDate = getCurrentDate();
    final data = prefs.get("roulette_$currentDate");
    if (data == null) {
      hasUnreadAlarm.value = true;
    } else if (!isLogin) {
      hasUnreadAlarm.value = false;
    } else {
      hasUnreadAlarm.value = await AlarmService.isUnReadAlarm();
    }
    update();
  }

  // hasUnreadAlarm 값을 변경한다.
  Future<void> changeHasUnreadAlarm(bool val) async {
    hasUnreadAlarm.value = val;
    if (!val) await AlarmService.setAlarmAllRead();
    update();
  }
}
