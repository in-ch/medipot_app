// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';

import 'package:medipot_app/app/constants/constants.dart';
import 'package:medipot_app/app/style/theme.dart';
import 'package:medipot_app/app/views/views.dart';

class FeedSubPage extends StatelessWidget {
  const FeedSubPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              leading: Padding(
                padding: const EdgeInsets.only(left: 9.0),
                child: SizedBox(
                  width: 100,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.abc_outlined,
                        size: 40,
                        color: colorScheme.primary,
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                SizedBox(
                  width: 85,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        size: 27,
                        color: colorScheme.primary,
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
              return const Center(
                child: Feeds(),
              );
            }),
          ),
        ),
      ),
    );
  }
}
