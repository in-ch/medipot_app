import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/routes/routes.dart';

class GoToAlarm extends StatelessWidget {
  const GoToAlarm({super.key});

  @override
  Widget build(BuildContext context) {
    final AlarmController alarmController = Get.put(AlarmController());
    return Center(
      child: GestureDetector(
          onTap: () async {
            await alarmController.changeHasUnreadAlarm(false);
            Get.toNamed(Routes.alarm);
          },
          child: const Icon(CupertinoIcons.bell, size: 24.0)),
    );
  }
}
