import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medipot_app/app/controllers/controllers.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:medipot_app/app/style/theme.dart';

class LocationDetailPage extends GetView<LocationDetailController> {
  const LocationDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              CupertinoIcons.back,
              color: Colors.black87,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: Obx(() {
            return SizedBox(
                child: controller.isLoading.value
                    ? SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: colorScheme.primary,
                            ),
                          ],
                        ),
                      )
                    : WebViewWidget(controller: controller.webviewController));
          })),
        ],
      ),
    );
  }
}
