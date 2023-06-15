import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:uni_links/uni_links.dart';
import 'package:get/get.dart';

import 'package:medipot_app/app/pages/pages.dart';

class DynamicLink {
  Future<bool> setup() async {
    bool isExistDynamicLink = await _getInitialDynamicLink();
    _addListener();

    return isExistDynamicLink;
  }

  Future<bool> _getInitialDynamicLink() async {
    final String? deepLink = await getInitialLink();
    if (deepLink != null) {
      PendingDynamicLinkData? dynamicLinkData = await FirebaseDynamicLinks
          .instance
          .getDynamicLink(Uri.parse(deepLink));

      if (dynamicLinkData != null) {
        _redirectScreen(dynamicLinkData);

        return true;
      }
    }

    return false;
  }

  void _addListener() {
    FirebaseDynamicLinks.instance.onLink.listen((
      PendingDynamicLinkData dynamicLinkData,
    ) {
      _redirectScreen(dynamicLinkData);
    }).onError((error) {
      debugPrint(error);
    });
  }

  void _redirectScreen(PendingDynamicLinkData dynamicLinkData) {
    if (dynamicLinkData.link.queryParameters.containsKey('no')) {
      String link = dynamicLinkData.link.path.split('/').last;
      String no = dynamicLinkData.link.queryParameters['no']!;

      switch (link) {
        case 'detail':
          Get.offAll(
            () => const DetailPage(),
            arguments: {
              "no": no,
            },
          );
          break;
      }
    }
  }

  Future<String> getShortLink(String screenName, int no) async {
    String dynamicLinkPrefix = 'https://medipotapp.page.link';
    final dynamicLinkParams = DynamicLinkParameters(
      uriPrefix: dynamicLinkPrefix,
      link: Uri.parse('$dynamicLinkPrefix/$screenName?no=$no'),
      androidParameters: const AndroidParameters(
        packageName: 'com.inch.medipotApp',
        minimumVersion: 0,
      ),
      iosParameters: const IOSParameters(
        bundleId: 'com.inch.medipotApp',
        minimumVersion: '0',
      ),
    );
    final dynamicLink =
        await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);

    return dynamicLink.shortUrl.toString();
  }
}
