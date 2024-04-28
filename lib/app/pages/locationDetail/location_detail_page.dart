import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/controllers/controllers.dart';

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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
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
                        : Column(
                            children: [
                              Flexible(
                                child: WebViewWidget(
                                    controller: controller.webviewController),
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 90,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 5.0, left: 10.0, top: 10),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              side: BorderSide(
                                                  color: colorScheme.primary),
                                            ),
                                          ),
                                          onPressed: () {
                                            controller
                                                .requestPremiumReport(context);
                                          },
                                          child: Text('무료 입지 리포트 신청',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      color:
                                                          colorScheme.primary)),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5.0, right: 10.0, top: 10),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              backgroundColor:
                                                  colorScheme.primary),
                                          onPressed: () {
                                            controller
                                                .makePhoneCall("01056922949");
                                          },
                                          child: Text('전화 문의',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      color: Colors.white)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ));
              })),
            ],
          ),
        ));
  }
}
