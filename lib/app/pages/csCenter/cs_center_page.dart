import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:docspot_app/app/constants/constants.dart';
import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';

class CsCenterPage extends GetView<CsCenterController> {
  const CsCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: appTheme,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                scrolledUnderElevation: 0,
                iconTheme: Theme.of(context).iconTheme,
                centerTitle: false,
                backgroundColor: Colors.white,
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
                title: SizedBox(
                  width: 200,
                  child: Text("고객센터",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineMedium),
                )),
            body: Expanded(
              child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListTile(
                          tileColor: Colors.white,
                          title: const Text("전화 문의"),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () async {
                            String telScheme = dotenv.get("CS_CENTER_CALL");
                            final Uri url = Uri.parse('tel:$telScheme');
                            if (!await launchUrl(url)) {
                              throw Exception('Could not launch $url');
                            }
                          },
                        ),
                        Container(
                            height: 10,
                            color: const Color.fromARGB(96, 235, 235, 235)),
                        Column(
                          children: faqs.map((faq) {
                            return AccordionWidget(
                                title: faq["title"]!,
                                description: faq["description"]!);
                          }).toList(),
                        ),
                      ],
                    ),
                  )),
            )));
  }
}
