import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

Future<void> openStore() async {
  String storeUrl;

  if (GetPlatform.isAndroid) {
    String androidAppId =
        dotenv.env['ANDROID_APP_ID'] ?? 'com.yourcompany.yourapp';
    storeUrl = 'https://play.google.com/store/apps/details?id=$androidAppId';
  } else if (GetPlatform.isIOS) {
    String appleAppId = dotenv.env['APPLE_APP_ID'] ?? 'YOUR_APP_ID';
    storeUrl = 'https://apps.apple.com/app/id$appleAppId';
  } else {
    storeUrl = 'https://play.google.com/store';
  }
  if (await canLaunchUrl(Uri.parse(storeUrl))) {
    await launchUrl(Uri.parse(storeUrl));
  } else {
    throw '스토어 URL을 열 수 없습니다: $storeUrl';
  }
}
