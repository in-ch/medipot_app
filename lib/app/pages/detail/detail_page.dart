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
        body: SizedBox(
          height: 200,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
