import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medipot_app/app/pages/pages.dart';
import 'package:medipot_app/app/style/theme.dart';

void main() {
  // GetX 초기화
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
    );
  }
}
