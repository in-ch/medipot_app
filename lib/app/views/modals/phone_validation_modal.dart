import 'package:flutter/material.dart';

class PhoneValidationModal extends StatelessWidget {
  const PhoneValidationModal({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("알림"),
      content: const Text("전화번호가 없습니다."),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // 다이얼로그 닫기
          },
          child: const Text("확인"),
        ),
      ],
    );
  }
}
