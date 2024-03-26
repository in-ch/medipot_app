import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/views/terms_and_privacy.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: SizedBox(
                width: 0.8 * MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/image/logo_text.png',
                      width: 150,
                    ),
                    const SizedBox(height: 20),
                    const Text("성공적인 개원의 필수적인 첫걸음",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: "PretendardBold")),
                    const SizedBox(height: 20),
                    const Text('''다양한 지역별 개원 입지부터
꼭 필요한 정보를 한 번에''',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            height: 1.5,
                            fontFamily: "PretendardRegular")),
                    const SizedBox(height: 220),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: 0.8 * MediaQuery.of(context).size.width,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFf6e10c),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () async {
                          controller.kakaoLogin(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/image/kakao_logo.png',
                              width: 40,
                              height: 40,
                            ),
                            const SizedBox(width: 10),
                            const Text("카카오로 계속하기",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'PretendardRegular')),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const TermsAndPrivacyPolicy(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
