import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medipot_app/app/controllers/controllers.dart';

import 'package:medipot_app/app/style/theme.dart';

class SettingSubPage extends StatefulWidget {
  const SettingSubPage({Key? key}) : super(key: key);

  @override
  State<SettingSubPage> createState() => _SettingSubPageState();
}

class _SettingSubPageState extends State<SettingSubPage> {
  final SettingController settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appTheme,
      child: Scaffold(
          appBar: AppBar(
            title: Container(),
          ),
          body: Column(
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      settingController.logout(context);
                    },
                    child: const Text("로그아웃"),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
