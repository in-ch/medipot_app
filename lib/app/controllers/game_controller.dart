import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:docspot_app/app/views/modals/taro_result_modal.dart';

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

  RxBool isDone = false.obs;

  @override
  void onInit() async {
    super.onInit();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String currentDate = getCurrentDate();
    final data = prefs.get("roulette_$currentDate");
    if (data != null) {
      isDone.value = true;
      update();
    }
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
  }

  void showResult(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String currentDate = getCurrentDate();
    final result = int.parse(prefs.getString("roulette_$currentDate")!);

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return TaroResultModal(resultNum: result);
      },
    );
  }

  void spinRoulette(BuildContext context) async {
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
    animationController.forward().whenComplete(() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String currentDate = getCurrentDate();
      prefs.setString("roulette_$currentDate", (random + 1).toString());

      isDone.value = true;
      update();
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return TaroResultModal(resultNum: random + 1);
        },
      );
    });
  }

  Color getColorForItem(int index) {
    return colors[index % colors.length];
  }

  String getCurrentDate() {
    DateTime now = DateTime.now();
    String formattedDate =
        "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    return formattedDate;
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
