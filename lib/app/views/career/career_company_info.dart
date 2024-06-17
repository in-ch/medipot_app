import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:docspot_app/app/views/views.dart';

class CareerCompanyInfo extends StatelessWidget {
  const CareerCompanyInfo(
      {super.key,
      required this.title,
      required this.href,
      required this.img,
      required this.address,
      required this.lat,
      required this.lng});

  final String title;
  final String href;
  final String img;
  final String address;
  final double lat;
  final double lng;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GoogleMapWidget(
          address: address,
          lat: lat,
          lng: lng,
        ),
        const SizedBox(height: 20),
        Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(135, 230, 230, 230),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 15.0),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: img == ""
                          ? Container(
                              width: 40, height: 40, color: Colors.black54)
                          : Image.network(img, width: 40, height: 40),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: Theme.of(context).textTheme.bodyMedium),
                      GestureDetector(
                        onTap: () async {
                          if (await canLaunchUrl(Uri.parse(href))) {
                            await launchUrl(Uri.parse(href));
                          }
                        },
                        child: Text(href.length > 20 ? '홈페이지 보기' : href,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Colors.blue[300],
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.blue[300],
                                    )),
                      ),
                    ],
                  )
                ],
              ),
            )),
        const SizedBox(
          height: 20,
        ),
        Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(135, 230, 230, 230),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 15.0),
              child: Text(
                  "본 초빙정보는 닥스팟의 동의없이 무단전재, 재배포, 재가공할 수 없으며, 구직활동 이외의 용도로 사용할 수 없습니다.",
                  style: Theme.of(context).textTheme.bodySmall),
            )),
      ],
    );
  }
}
