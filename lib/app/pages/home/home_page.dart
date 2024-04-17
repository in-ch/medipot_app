import 'package:flutter/material.dart';

import 'package:docspot_app/app/pages/pages.dart';
import 'package:docspot_app/app/views/views.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: _buildPage(_currentIndex),
          bottomNavigationBar: Material(
            elevation: 8,
            child: BottomNavigation(
              currentIndex: _currentIndex,
              onTabTapped: _onTabTapped,
            ),
          )),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return const MapSubPage();
      case 1:
        return const FavoritesSubPage();
      case 2:
        return const SettingSubPage();
      default:
        return Container();
    }
  }
}
