import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/app/views/views.dart';

class EventsPage extends GetView<EventsController> {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appTheme,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme,
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 54,
          leading: const Align(
            alignment: Alignment.centerRight,
            child: CustomBackButton(),
          ),
          title: Text("이벤트들",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: GestureDetector(
                    child: const Icon(CupertinoIcons.share),
                    onTap: () {
                      Navigator.of(context).pop();
                    }),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Center(
                child: Icon(CupertinoIcons.ellipsis_circle),
              ),
            ),
          ],
        ),
        body: Obx(() => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(child: _EventBody(events: controller.events)),
                ],
              )),
      ),
    );
  }
}

class _EventBody extends StatelessWidget {
  final List<Event> events;
  const _EventBody({required this.events});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: ListView(
        children: events
            .map(
              (event) => Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: GestureDetector(
                  onTap: () async {
                    String webviewLink = dotenv.get("WEBVIEW_SERVER");
                    int eventNo = event.no;
                    final Uri url = Uri.parse('$webviewLink/event/$eventNo');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 140,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          event.img,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
