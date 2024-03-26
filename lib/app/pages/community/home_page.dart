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
      home: Scaffold(
        body: _buildPage(_currentIndex),
        bottomNavigationBar: BottomNavigation(
          currentIndex: _currentIndex,
          onTabTapped: _onTabTapped,
        ),
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return const FeedSubPage();
      case 1:
        return const MapSubPage();
      case 2:
        return Container();
      case 3:
        return Container();
      default:
        return Container();
    }
  }
}
