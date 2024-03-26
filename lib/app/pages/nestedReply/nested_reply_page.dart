import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';

class NestedReplyPage extends GetView<NestedReplyController> {
  const NestedReplyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: appTheme,
        child: Scaffold(
          appBar: AppBar(
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
                  : SizedBox(
                      width: 200,
                      child: Text('${controller.userName.value}님의 댓글',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headlineMedium),
                    ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Obx(
              () => controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : controller.nestedReplys.isNotEmpty
                      ? SingleChildScrollView(
                          child: NestedCommentList(
                            nestedReplys: controller.nestedReplys,
                            isLoading: controller.isLoading.value,
                            hasMore: controller.hasMore.value,
                            fetchMore: controller.getNestedReplys,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                          child: Text("대댓글이 아직 없습니다.",
                              style: Theme.of(context).textTheme.displayMedium),
                        ),
            ),
          ),
        ));
  }
}
