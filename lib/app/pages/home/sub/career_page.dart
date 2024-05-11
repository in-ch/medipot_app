import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';

class CareerPage extends GetView<CareerController> {
  const CareerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appTheme,
      child: Scaffold(
          appBar: AppBar(
            iconTheme: Theme.of(context).iconTheme,
            centerTitle: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leadingWidth: 54,
            title: Image.asset(
              'assets/image/logo_text.png',
              width: 70,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Center(
                  child: GestureDetector(
                      child: const Icon(CupertinoIcons.search, size: 24.0),
                      onTap: () {}),
                ),
              ),
              const SizedBox(width: 10),
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Center(
                  child: Icon(CupertinoIcons.bell, size: 24.0),
                ),
              ),
            ],
          ),
          body: const Column(
            children: [
              Expanded(child: Text("유계")),
            ],
          )),
    );
  }
}
