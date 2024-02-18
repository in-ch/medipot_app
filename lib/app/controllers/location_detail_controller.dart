import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LocationDetailController extends GetxController {
  RxBool isLoading = true.obs;

  late final WebViewController webviewController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String webviewLink = dotenv.get("WEBVIEW_SERVER");

  @override
  void onInit() {
    int locationNo = Get.arguments['locationNo'];
    Future.delayed(Duration.zero, () async {
      webviewController = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {},
            onPageStarted: (String url) {
              isLoading.value = true;
            },
            onPageFinished: (String url) {
              isLoading.value = false;
            },
            onWebResourceError: (WebResourceError error) {},
          ),
        )
        ..loadRequest(Uri.parse('$webviewLink/location/detail/$locationNo'));
    });
    // update();
    super.onInit();
  }
}
