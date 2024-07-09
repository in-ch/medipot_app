import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/views/views.dart';

class AlarmPage extends GetView<AlarmController> {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          iconTheme: Theme.of(context).iconTheme,
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 54,
          leading: const Align(
            alignment: Alignment.centerRight,
            child: CustomBackButton(),
          ),
          title:
              Text("알림 정보", style: Theme.of(context).textTheme.headlineSmall),
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Text("알림 정보가 없습니다.",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: const Color.fromARGB(255, 126, 126, 126))),
              ),
              const SizedBox(height: 200),
            ],
          ),
        ));
  }
}
