import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_balloon/speech_balloon.dart';

import 'package:docspot_app/app/controllers/controllers.dart';

class ShowNewAlarms extends StatelessWidget {
  const ShowNewAlarms({super.key});

  @override
  Widget build(BuildContext context) {
    final AlarmController alarmController = Get.put(AlarmController());
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Padding(
        padding: const EdgeInsets.only(top: 8.0, right: 10),
        child: Obx(() {
          Color balloonColor = alarmController.hasUnreadAlarm.value
              ? const Color.fromARGB(255, 57, 63, 255)
              : const Color.fromARGB(255, 255, 255, 255);

          return SpeechBalloon(
            width: 45,
            height: 18,
            nipLocation: NipLocation.top,
            borderRadius: 4,
            color: balloonColor, // 동적으로 색상 변경
            child: Center(
              child: Text(
                'new',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: Colors.white),
              ),
            ),
          );
        }),
      ),
    ]);
  }
}
