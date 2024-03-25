import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:medipot_app/data/models/models.dart';

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

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print(event.notification!.title);
      print(event.notification!.body);
    });
  }

  void _getToken() async {
    String? token = await messaging.getToken();
    try {} catch (e) {}
  }
}
