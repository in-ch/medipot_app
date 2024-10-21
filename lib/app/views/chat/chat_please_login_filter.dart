import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:docspot_app/app/views/views.dart';

class ChatPleaseLoginFilter extends StatelessWidget {
  const ChatPleaseLoginFilter({super.key, required this.goToLogin});
  final Function goToLogin;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          color: Colors.black.withOpacity(0.3),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "로그인이 필요합니다.",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(height: 10),
                const Text(
                  "로그인 후 실시간 채팅 기능을 이용해보세요.",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                CommonButton(
                  onClick: goToLogin,
                  text: "로그인하러 가기",
                  isReverse: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
