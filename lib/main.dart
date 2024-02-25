import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import 'package:medipot_app/app/routes/routes.dart';
import 'package:medipot_app/app/pages/pages.dart';
import 'package:medipot_app/app/style/theme.dart';
import 'package:medipot_app/data/models/models.dart';
import 'package:medipot_app/firebase_options.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await DynamicLink().setup();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  KakaoSdk.init(nativeAppKey: '10c1f46910f538e0b63ddedfdfb952bc');

  runZonedGuarded(
    () {
      runApp(const MyApp());
    },
    (error, stack) => FirebaseCrashlytics.instance.recordError(
      error,
      stack,
      fatal: true,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: appTheme,
      home: const HomePage(),
      initialRoute: Routes.home,
      initialBinding:
          BindingsBuilder.put(() => NotificationController(), permanent: true),
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
