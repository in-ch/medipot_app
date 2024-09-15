import 'package:docspot_app/app/routes/routes.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoToTaroGame extends StatelessWidget {
  const GoToTaroGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color.fromARGB(255, 220, 220, 220)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: GestureDetector(
          onTap: () => Get.toNamed(Routes.roulette),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("오늘의 운세 🍀",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.primary)),
              const SizedBox(height: 3),
              const Text("오늘의 타로 카드를 뽑아보세요. 🥰",
                  style: TextStyle(fontWeight: FontWeight.w300)),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
