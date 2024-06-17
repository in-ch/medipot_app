import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/views/views.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          iconTheme: Theme.of(context).iconTheme,
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 54,
          leading: const Align(
            alignment: Alignment.centerRight,
            child: CustomBackButton(),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: GetPlatform.isIOS ? 2 : 3,
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
                    SizedBox(
                        height:
                            MediaQuery.of(context).size.height < 700 ? 10 : 20),
                    Text("성공적인 개원의 필수적인 첫걸음",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.height < 700
                                ? 20
                                : 24,
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
                      height:
                          MediaQuery.of(context).size.height < 700 ? 40 : 50,
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
                            SizedBox(
                              width: 50,
                              child: Image.asset(
                                'assets/image/kakao_logo.png',
                                width: 25,
                                height: 25,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const SizedBox(
                              width: 120,
                              child: Text("카카오로 계속하기",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'PretendardRegular')),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: GetPlatform.isIOS
                          ? MediaQuery.of(context).size.height < 700
                              ? 5
                              : 10
                          : 0),
                  GetPlatform.isIOS
                      ? Center(
                          child: SizedBox(
                            width: 0.8 * MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height < 700
                                ? 40
                                : 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF000000),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 0,
                              ),
                              onPressed: () async {
                                controller.appleLogin(context);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 50,
                                    child: Image.asset(
                                      'assets/image/logo_apple.png',
                                      width:
                                          MediaQuery.of(context).size.height <
                                                  700
                                              ? 20
                                              : 30,
                                      height:
                                          MediaQuery.of(context).size.height <
                                                  700
                                              ? 20
                                              : 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const SizedBox(
                                    width: 120,
                                    child: Text("애플로 계속하기",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'PretendardRegular')),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
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
