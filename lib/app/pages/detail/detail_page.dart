import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';
import 'package:docspot_app/data/models/models.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appTheme,
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          iconTheme: Theme.of(context).iconTheme,
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 54,
          leading: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
                child: const Icon(CupertinoIcons.back),
                onTap: () {
                  Navigator.of(context).pop();
                }),
          ),
          title: Obx(
            () => controller.isLoading.value
                ? Text("로딩 중...",
                    style: Theme.of(context).textTheme.headlineMedium)
                : Text(controller.writing.title,
                    style: Theme.of(context).textTheme.headlineMedium),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: GestureDetector(
                    child: const Icon(CupertinoIcons.share),
                    onTap: () {
                      Navigator.of(context).pop();
                    }),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Center(
                child: Icon(CupertinoIcons.ellipsis_circle),
              ),
            ),
          ],
        ),
        body: Obx(() => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(child: _DetailBody(writing: controller.writing)),
                ],
              )),
      ),
    );
  }
}

class _DetailBody extends StatelessWidget {
  final Writing writing;
  const _DetailBody({required this.writing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: ListView(
        children: [FeedWidget(isDetail: true, writing: writing)],
      ),
    );
  }
}
