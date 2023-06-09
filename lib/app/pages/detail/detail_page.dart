import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medipot_app/app/controllers/controllers.dart';
import 'package:medipot_app/app/style/theme.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appTheme,
      child: Scaffold(
        body: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.someMethod();
                        },
                        child: Text(
                          'headlineLarge',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                      Text(
                        controller.writing.title,
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        controller.writing.text,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
