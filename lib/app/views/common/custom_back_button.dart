import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/routes/routes.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!Navigator.canPop(context)) {
          Get.offAllNamed(Routes.home);
        }
        Get.back();
      },
      child: Container(
        color: const Color.fromRGBO(255, 255, 255, 0),
        width: 60,
        height: 60,
        child: const Icon(CupertinoIcons.back),
      ),
    );
  }
}
