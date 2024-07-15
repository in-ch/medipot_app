import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:docspot_app/app/routes/routes.dart';
import 'package:docspot_app/app/style/theme.dart';

class PleaseLoginAtMain extends StatefulWidget {
  const PleaseLoginAtMain({super.key});

  @override
  State<PleaseLoginAtMain> createState() => _PleaseLoginAtMainModalState();
}

class _PleaseLoginAtMainModalState extends State<PleaseLoginAtMain> {
  void setHideForDay() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    prefs.setString('hideForDayDate', formattedDate);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 430,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 220, 220, 220),
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "알림서비스",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "로그인 후 진료과에 맞는 초빙 정보 알림을 받아보세요.",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
            child: SizedBox(
              width: double.infinity,
              height: 280,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0, backgroundColor: colorScheme.primary),
                onPressed: () {
                  Get.toNamed(Routes.login);
                },
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text('초빙 정보 알림이 필요하신가요?',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700)),
                    const SizedBox(height: 5),
                    Text('로그인 후에 진료과에 맞는 초빙 정보 알림을 받아보세요!',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.white, fontSize: 14)),
                    const SizedBox(height: 20),
                    Image.asset(
                      'assets/image/doctor.png',
                      width: 120,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("로그인 하러가기",
                              style: Theme.of(context).textTheme.labelMedium),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
            child: SizedBox(
              width: double.infinity,
              child: GestureDetector(
                onTap: () {
                  setHideForDay();
                },
                child: const Text(
                  "하루 간 보지 않기",
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
