import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:medipot_app/app/routes/routes.dart';

class SettingButtonBoxs extends StatelessWidget {
  const SettingButtonBoxs({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.consultList);
              },
              child: Column(
                children: [
                  const SizedBox(height: 7),
                  const SizedBox(
                    width: 36,
                    height: 36,
                    child: Image(
                      image: AssetImage('assets/image/search.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text("상담 목록", style: Theme.of(context).textTheme.titleSmall)
                ],
              ),
            ),
            const SizedBox(width: 30),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.csCenter);
              },
              child: Column(
                children: [
                  const SizedBox(
                    width: 50,
                    height: 50,
                    child: Image(
                      image: AssetImage('assets/image/hours.png'),
                      width: 50,
                      height: 50,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text("고객센터", style: Theme.of(context).textTheme.titleSmall)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
