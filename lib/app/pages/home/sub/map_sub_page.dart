import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:medipot_app/app/style/theme.dart';

class MapSubPage extends StatefulWidget {
  const MapSubPage({Key? key}) : super(key: key);

  @override
  State<MapSubPage> createState() => MapSubPageState();
}

class MapSubPageState extends State<MapSubPage> {
  late final WebViewController controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? accessToken = prefs.getString('accessToken');
      String? refreshToken = prefs.getString('refreshToken');

      print(
          'http://localhost:3000/webview/map?user_token_refresh_token=$accessToken///$refreshToken');
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
        ..loadRequest(Uri.parse(
            'http://localhost:3000/webview/map?user_token_refresh_token=$accessToken///$refreshToken'));
    });
  }

  Future<bool> _onWillPop() async {
    if (await controller.canGoBack()) {
      controller.goBack();
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                  child: isLoading
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
                      : WebViewWidget(controller: controller)),
            ),
          ],
        ),
      ),
    );
  }
}
