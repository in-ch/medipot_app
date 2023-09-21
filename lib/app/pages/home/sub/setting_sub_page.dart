import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:medipot_app/app/controllers/controllers.dart';
import 'package:medipot_app/app/style/theme.dart';

class SettingSubPage extends GetView<SettingController> {
  const SettingSubPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appTheme,
      child: Scaffold(
          appBar: AppBar(
            title: Container(),
          ),
          body: const Column(
            children: [Expanded(child: _SettingBody())],
          )),
    );
  }
}

class _SettingBody extends StatelessWidget {
  const _SettingBody();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Hello Setting page"),
    );
  }
}
