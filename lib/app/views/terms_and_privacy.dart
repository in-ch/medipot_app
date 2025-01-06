import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TermsAndPrivacyPolicy extends StatelessWidget {
  const TermsAndPrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, bottom: 30.0),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(color: Colors.black, fontSize: 12.0),
            children: <TextSpan>[
              const TextSpan(
                text: '계속하기 버튼을 클릭하여 로그인 시 ',
              ),
              TextSpan(
                text: '서비스이용약관',
                style: const TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    String webviewLink = dotenv.get("WEBVIEW_SERVER");
                    final Uri url = Uri.parse('$webviewLink/termsOfUse');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
              ),
              const TextSpan(
                text: ' 및 ',
              ),
              TextSpan(
                text: '개인정보처리방침',
                style: const TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    String webviewLink = dotenv.get("WEBVIEW_SERVER");
                    final Uri url = Uri.parse('$webviewLink/privacyPolicy');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
              ),
              const TextSpan(
                text: '에 동의한 것으로 간주됩니다.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
