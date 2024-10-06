import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';

class LoginModal extends StatelessWidget {
  LoginModal({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: double.infinity,
        height: 130,
        child: Column(
          children: [
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
