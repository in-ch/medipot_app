// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';

import 'package:docspot_app/app/constants/constants.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';
import 'package:docspot_app/data/models/models.dart';

class FeedSubPage extends StatefulWidget {
  const FeedSubPage({super.key});

  @override
  State<FeedSubPage> createState() => _FeedSubPageState();
}

class _FeedSubPageState extends State<FeedSubPage> {
  @override
  Widget build(BuildContext context) {
    LocalNotification.requestPermission();

    return DefaultTabController(
      length: tags.length,
      child: Theme(
        data: appTheme,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: AppBar(
              backgroundColor: Colors.white,
              bottom: TabBar(
                indicatorWeight: 3,
                isScrollable: true,
                tabs: List<Widget>.generate(tags.length, (int index) {
                  return Tab(text: tags[index]);
                }),
              ),
              title: const SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("커뮤니티",
                        style: TextStyle(
                            fontSize: 21.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
              actions: [
                SizedBox(
                  width: 85,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          LocalNotification.sendNotification("TITLE", "TEXT");
                        },
                        child: Icon(
                          Icons.search,
                          size: 27,
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Icon(
                        Icons.person,
                        size: 27,
                        color: colorScheme.primary,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: List<Widget>.generate(tags.length, (int index) {
              return Center(
                child: Feeds(tag: tags[index]),
              );
            }),
          ),
        ),
      ),
    );
  }
}
