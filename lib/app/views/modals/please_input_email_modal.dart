import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:docspot_app/app/routes/routes.dart';
import 'package:docspot_app/app/style/theme.dart';

class PleaseInputEmailModal extends StatefulWidget {
  const PleaseInputEmailModal({super.key});

  @override
  State<PleaseInputEmailModal> createState() => _PleaseLoginAtMainModalState();
}

class _PleaseLoginAtMainModalState extends State<PleaseInputEmailModal> {
  void setHideForEmailRequest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('hideForEmailRequest', "true");
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: SizedBox(
        width: 270,
        height: 200,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text('신규 초빙 정보 알림',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: const Color.fromARGB(255, 34, 34, 34),
                                fontWeight: FontWeight.w700)),
                    const SizedBox(height: 5),
                    Text('이메일 입력 후 매주 새로운 초빙 정보 알림을 받아보세요.',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: const Color.fromARGB(255, 34, 34, 34),
                            fontSize: 14)),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () async {
                        bool result = await Get.toNamed(Routes.email);
                        if (result) Navigator.of(context).pop();
                      },
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("이메일 입력하기",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                        color: Colors.white, fontSize: 14)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: setHideForEmailRequest,
              child: Text("다시 보지 않기",
                  style: Theme.of(context).textTheme.titleSmall),
            ),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}
