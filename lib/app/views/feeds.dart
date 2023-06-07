// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medipot_app/app/controllers/controllers.dart';
import 'package:medipot_app/app/views/views.dart';

class Feeds extends GetView<FeedController> {
  const Feeds({Key? key, required this.tag, required this.text})
      : super(key: key);

  @override
  final String tag;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedController>(
      init: FeedController(tag: tag, text: text),
      builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tag.toString(),
                style: const TextStyle(color: Colors.red),
              ),
              const FeedWidget(
                isDetail: false,
                hideFollow: false,
              ),
              const FeedWidget(
                isDetail: false,
                hideFollow: false,
              ),
              const FeedWidget(
                isDetail: false,
                hideFollow: false,
              ),
              const FeedWidget(
                isDetail: false,
                hideFollow: false,
              ),
            ],
          ),
        );
      },
    );
  }
}
