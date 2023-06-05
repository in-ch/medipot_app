// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';

import 'package:medipot_app/constants/constants.dart';
import 'package:medipot_app/style/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

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
              title: const Text("asdfasf", style: TextStyle(color: Colors.red)),
              bottom: TabBar(
                indicatorWeight: 3,
                isScrollable: true,
                tabs: List<Widget>.generate(tags.length, (int index) {
                  return Tab(text: tags[index]);
                }),
              ),
            ),
          ),
          body: TabBarView(
            children: List<Widget>.generate(tags.length, (int index) {
              return Center(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text('Outline Button'),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
