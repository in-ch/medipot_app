import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/routes/routes.dart';
import 'package:docspot_app/app/style/theme.dart';

// ignore: must_be_immutable
class NotLogin extends StatelessWidget {
  NotLogin({Key? key, required this.text, this.onlyText = false})
      : super(key: key);
  String text;
  bool onlyText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 154, 154, 154))),
              const SizedBox(height: 10),
              onlyText
                  ? const SizedBox()
                  : ElevatedButton(
                      onPressed: () async {
                        Get.toNamed(Routes.login);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            colorScheme.primary),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        '로그인 하기',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
            ],
          )
        ],
      ),
    );
  }
}
