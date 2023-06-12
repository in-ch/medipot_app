import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import 'package:medipot_app/app/pages/pages.dart';
import 'package:medipot_app/app/style/theme.dart';
import 'package:medipot_app/data/models/models.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DynamicLink().setup();

  //화면 회전 막는 기능
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await dotenv.load(fileName: '.env');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: appTheme,
      home: const HomePage(), // 애플리케이션의 첫 번째 페이지 (필수)
      initialRoute: '/', // 초기 라우트 설정 (옵션)
      getPages: AppPages.pages, // 라우트 설정 (옵션)
      unknownRoute: GetPage(
          name: '/not-found',
          page: () => const NotFoundPage()), // 알 수 없는 경로 설정 (옵션)
      debugShowCheckedModeBanner: false,
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
    );
  }
}
