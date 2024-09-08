import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].obs;

  final List<double> probabilityValues = [
    0.2115, // 1
    0.306, // 2
    0.2955, // 3
    0.285, // 4
    0.2745, // 5
    0.264, // 6
    0.2535, // 7
    0.243, // 8
    0.2325, // 9
    0.222 // 10
  ];

  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
  ];

  final selectedItem = (-1).obs;
  final animationValue = 0.0.obs;

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
  }

  void spinRoulette() async {
    final int random = Random().nextInt(10);
    double randomValue = probabilityValues[random];
    double rotationMultiplier = 5 + randomValue * 3;
    double endRotation = pi * rotationMultiplier;
    final CurvedAnimation curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    );
    animation =
        Tween<double>(begin: 0, end: endRotation).animate(curvedAnimation)
          ..addListener(() {
            animationValue.value = animation.value;
          });

    animationController.reset();
    animationController.forward().whenComplete(() {
      selectedItem.value = random;
    });
  }

  Color getColorForItem(int index) {
    return colors[index % colors.length];
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
