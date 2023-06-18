import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:medipot_app/app/controllers/controllers.dart';
import 'package:medipot_app/app/style/theme.dart';

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
            title: const Text("Nested Page"),
          ),
          body: Container(),
        ));
  }
}
