import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';

class RouletteGamePage extends GetView<GameController> {
  const RouletteGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appTheme,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme,
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 54,
          leading: const Align(
            alignment: Alignment.centerRight,
            child: CustomBackButton(),
          ),
          title: Text("오늘의 행운의 숫자",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: GestureDetector(
                    child: const Icon(CupertinoIcons.share),
                    onTap: () {
                      Navigator.of(context).pop();
                    }),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Center(
                child: Icon(CupertinoIcons.ellipsis_circle),
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Transform.rotate(
                angle: controller.animationValue.value * 2 * pi,
                child: CustomPaint(
                  size: const Size(300, 300),
                  painter: RoulettePainter(
                    items: controller.items.map((v) => v.toString()).toList(),
                    colors: controller.colors,
                  ),
                ),
              );
            }),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: controller.spinRoulette,
              child: const Text('돌리기'),
            ),
            const SizedBox(height: 20),
            Obx(() {
              return controller.selectedItem.value >= 0
                  ? Text(
                      'Selected: ${controller.items[controller.selectedItem.value]}',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    )
                  : const SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}
