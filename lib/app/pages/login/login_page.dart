import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                child: Center(
                  child: Image.asset(
                    'assets/image/logo.png',
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1, // 1/3 높이
              child: Container(
                child: Center(
                  child: SizedBox(
                    width: 0.8 * MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // 버튼 클릭 시 수행할 동작 추가
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/image/kakao_logo.png',
                            width: 10,
                            height: 10,
                          ),
                          const Text("카카오로 로그인"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
