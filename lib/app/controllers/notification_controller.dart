import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/services/services.dart';

class NotificationController extends GetxController {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  @override
  void onInit() async {
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    _getToken();
    LocalNotification.initialize();
    _configureMessaging();
    super.onInit();
  }

  void _configureMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // 앱이 foreground 상태일 때 메시지를 수신하면 호출됩니다.
      LocalNotification.sendNotification(message.notification!.title.toString(),
          message.notification!.body.toString());
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data.containsKey('page') && message.data.containsKey('no')) {
        Get.toNamed(message.data['page'],
            arguments: {'no': int.parse(message.data['no'])});
      } else {
        debugPrint('Page or No data missing in message');
      }

      if (message.notification != null) {
        debugPrint(message.notification!.title);
        debugPrint(message.notification!.body);
      }
    });
  }

  void _getToken() async {
    String? token = await messaging.getToken();
    try {
      debugPrint("firebase token--------------------");
      debugPrint(token);
      final response = await UserService.me();
      final data = response['data'];
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("fcmToken", token!);

      if (data == null) {
        bool isLogin = prefs.getBool('isLogin') ?? false;
        if (isLogin) {
          await UserService.refresh();
          await UserService.updateFcmToken(token);
        } else {
          prefs.setString('nickname', "");
          prefs.setString('userNo', "");
          prefs.setString('phone', "");
          prefs.setString('accessToken', "");
          prefs.setString('refreshToken', "");
          prefs.setBool('isLogin', false);
        }
      } else {
        await UserService.updateFcmToken(token);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
