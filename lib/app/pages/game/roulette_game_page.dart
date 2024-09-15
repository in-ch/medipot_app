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
          title: Text("오늘의 타로카드",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Center(
                child: GestureDetector(
                    child: const Icon(CupertinoIcons.share),
                    onTap: () {
                      Navigator.of(context).pop();
                    }),
              ),
            ),
          ],
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: '', // 기본 텍스트
                  style: Theme.of(context).textTheme.headlineLarge,
                  children: const [
                    TextSpan(
                      text: '룰렛',
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                    TextSpan(text: '을 돌려주세요.'),
                  ],
                ),
              ),
              const SizedBox(height: 3),
              RichText(
                text: TextSpan(
                  text: '오늘의 ',
                  style: Theme.of(context).textTheme.titleMedium,
                  children: const [
                    TextSpan(
                      text: '타로 카드',
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                    TextSpan(text: '를 알려드릴게요. 🍀'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const TriangleWidget(),
              const SizedBox(height: 5),
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
              Obx(
                () => controller.isDone.value
                    ? ElevatedButton(
                        onPressed: () => controller.showResult(context),
                        child: const Text('결과보기'),
                      )
                    : ElevatedButton(
                        onPressed: () => controller.spinRoulette(context),
                        child: const Text('돌리기'),
                      ),
              ),
              const SizedBox(height: 20),
              Obx(() {
                return controller.selectedItem.value >= 0
                    ? Text(
                        '뽑힌 숫자: ${controller.items[controller.selectedItem.value]}',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )
                    : const SizedBox.shrink();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
