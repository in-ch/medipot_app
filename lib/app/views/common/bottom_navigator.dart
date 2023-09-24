// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:medipot_app/app/style/theme.dart';

class BottomNavigation extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTabTapped;

  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTabTapped,
  });

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTabTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: '관심 목록',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '설정',
        ),
      ],
      selectedItemColor: colorScheme.primary, // 선택된 아이템의 아이콘 색상
      unselectedItemColor: Colors.black26, // 선택되지 않은 아이템의 아이콘 색상
      selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w200,
          color: colorScheme.primary), // 선택된 아이템의 레이블 스타일
      unselectedLabelStyle:
          const TextStyle(fontWeight: FontWeight.w200, color: Colors.black26),
    );
  }
}
