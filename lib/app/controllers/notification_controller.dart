import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/services/services.dart';
import 'package:docspot_app/app/constants/constants.dart';

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
    // 앱이 종료된 상태에서 푸시 알림을 통해 실행된 경우 처리
    _checkInitialMessage();
    super.onInit();
  }

  void _checkInitialMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }
  }

  void _handleMessage(RemoteMessage message) {
    if (message.data.containsKey('page') && message.data.containsKey('no')) {
      Get.toNamed(message.data['page'],
          arguments: {'no': int.parse(message.data['no'])});
    } else {
      debugPrint('Page or No data missing in message');
    }
  }

  void _configureMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
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
    });
  }

  void _getToken() async {
    String? token = await messaging.getToken();
    try {
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
          prefs.setString('grant', Grant.NONE.toString());
        }
      } else {
        await UserService.updateFcmToken(token);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
