import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:docspot_app/app/views/views.dart';

class ChatPleaseGrantFilter extends StatelessWidget {
  ChatPleaseGrantFilter({super.key, required this.goToGrant});

  Function goToGrant;

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
                  "의사 회원 인증이 필요합니다.",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(height: 10),
                const Text(
                  "간단하게 의사 인증을 해보세요.",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                CommonButton(
                  onClick: () {
                    goToGrant(context);
                  },
                  text: "인증하러 가기",
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
