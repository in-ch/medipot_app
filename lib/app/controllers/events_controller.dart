import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/services/services.dart';

class EventsController extends GetxController {
  RxBool isLoading = false.obs;

  List<Event> events = [];

  @override
  void onInit() async {
    await getEvents();
    super.onInit();
  }

  /// [비즈니스 로직]
  /// 이벤트를 조회한다.
  Future<dynamic> getEvents() async {
    try {
      isLoading.value = true;
      final response = await EventsService.getEvents();
      if (response['statusCode'] == 200) {
        final data = response['data'];
        events = List<Event>.from(data.map((item) => Event.fromJson(item)));
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
