import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/routes/routes.dart';
import 'package:docspot_app/app/pages/pages.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/firebase_options.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  KakaoSdk.init(nativeAppKey: dotenv.get("KAKAO_SDK_KEY"));
  AppInit.tokenCheck();

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
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      initialRoute: Routes.home,
      initialBinding:
          BindingsBuilder.put(() => NotificationController(), permanent: true),
      getPages: AppPages.pages, // 라우트 설정 (옵션)
      unknownRoute: GetPage(
          name: '/not-found',
          page: () => const NotFoundPage()), // 알 수 없는 경로 설정 (옵션)
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
    );
  }
}
