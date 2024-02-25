import 'package:flutter/material.dart';
import 'package:medipot_app/app/pages/pages.dart';
import 'package:medipot_app/app/views/views.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  bool isAuth = false;

  @override
  void didChangeDependencies() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isAuth = prefs.getBool('isLogin') ?? false;
    setState(() {});
    super.didChangeDependencies();
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);

    return MaterialApp(
      home: Scaffold(
        body: isAuth ? _buildPage(_currentIndex) : LoginPage(),
        bottomNavigationBar: isAuth
            ? Material(
                elevation: 8,
                child: BottomNavigation(
                  currentIndex: _currentIndex,
                  onTabTapped: _onTabTapped,
                ),
              )
            : Container(height: 0),
      ),
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
