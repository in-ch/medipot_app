import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medipot_app/app/controllers/controllers.dart';
import 'package:medipot_app/app/views/views.dart';

class Feeds extends GetView<FeedController> {
  const Feeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => FeedController());
    controller.fetchList('', '');

    return GetBuilder<FeedController>(builder: (controller) {
      return const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FeedWidget(
              isDetail: false,
              hideFollow: false,
            ),
            FeedWidget(
              isDetail: false,
              hideFollow: false,
            ),
            FeedWidget(
              isDetail: false,
              hideFollow: false,
            ),
            FeedWidget(
              isDetail: false,
              hideFollow: false,
            ),
          ],
        ),
      );
    });
  }
}
