import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {
  LocalNotification._();

  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static initialize() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings("mipmap/ic_launcher");

    DarwinInitializationSettings initializationSettingsIOS =
        const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: false,
    );

    InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse details) async {
      /// local 클릭했을 시 이벤트 실행
      print("-------------------------------------------------------------");
      print('onDidReceiveNotificationResponse - payload: ${details.payload}');
      print("-------------------------------------------------------------");

      final payload = details.payload ?? '';
      // if (!parsedJson.containsKey('routeTo')) {
      //   return;
      // }
      // Get.toNamed(parsedJson['routeTo']);
    });
  }

  static void requestPermission() {
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: false,
        );
  }

  static Future<void> sendNotification(String title, String body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails("channel id", "channel name",
            channelDescription: "channel description",
            importance: Importance.max,
            priority: Priority.max,
            showWhen: false);

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: DarwinNotificationDetails(
        badgeNumber: 1,
      ),
    );

    await _flutterLocalNotificationsPlugin
        .show(0, title, body, platformChannelSpecifics, payload: "item x");
  }
}
