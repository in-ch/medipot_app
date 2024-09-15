import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:docspot_app/app/routes/routes.dart';
import 'package:docspot_app/app/views/views.dart';

class MapSubPage extends StatefulWidget {
  const MapSubPage({super.key});

  @override
  State<MapSubPage> createState() => MapSubPageState();
}

class MapSubPageState extends State<MapSubPage> {
  late final WebViewController controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final MapController mapController = Get.put(MapController());
  bool isLoading = true;
  String webviewLink = dotenv.get("WEBVIEW_SERVER");
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {},
            onPageStarted: (String url) {
              setState(() {
                isLoading = true;
              });
            },
            onPageFinished: (String url) {
              setState(() {
                isLoading = false;
              });
            },
            onWebResourceError: (WebResourceError error) {},
          ),
        )
        ..loadRequest(Uri.parse('$webviewLink/webview'));
      controller.addJavaScriptChannel("medipot",
          onMessageReceived: (JavaScriptMessage message) {
        Get.toNamed(Routes.locationDetail,
            arguments: {'locationNo': int.parse(message.message)});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: PopScope(
        onPopInvoked: (bool didPop) {
          if (didPop) {
            controller.goBack();
          }
        },
        child: Column(
          children: [
            const SizedBox(height: 40),
            Expanded(
              child: SizedBox(
                  child: isLoading
                      ? const SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [AnimatedCrossFadeScreen()],
                          ),
                        )
                      : WebViewWidget(controller: controller)),
            ),
          ],
        ),
      ),
    );
  }
}
