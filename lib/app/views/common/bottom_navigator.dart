import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/routes/routes.dart';
import 'package:docspot_app/app/style/theme.dart';

class BottomNavigation extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTabTapped;

  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTabTapped,
  });

  @override
  BottomNavigationWidgetState createState() => BottomNavigationWidgetState();
}

class BottomNavigationWidgetState extends State<BottomNavigation> {
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.card_travel, '초빙 정보', 0),
          _buildNavItem(Icons.article, '학술지', 1),
          Obx(() => _buildChatNavItem(Icons.chat, '오픈 채팅', 2,
              homeController.unReadMsgCount.value.toString(), Routes.chat)),
          _buildNavItem(Icons.favorite, '관심 목록', 3),
          _buildNavItem(Icons.settings, '설정', 4),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => widget.onTabTapped(index),
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              icon,
              color: widget.currentIndex == index
                  ? colorScheme.primary
                  : Colors.black26,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                color: widget.currentIndex == index
                    ? colorScheme.primary
                    : Colors.black26,
                fontSize: 12,
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatNavItem(
      IconData icon, String label, int index, String badgeText, String route) {
    return GestureDetector(
      onTap: () => Get.toNamed(route),
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: SizedBox(
                    width: 60,
                    height: 30,
                    child: Icon(
                      icon,
                      color: widget.currentIndex == index
                          ? colorScheme.primary
                          : Colors.black26,
                    ),
                  ),
                ),
                badgeText == "0"
                    ? Container()
                    : Positioned(
                        right: badgeText.length > 1 ? 0 : 5,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            badgeText,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                color: widget.currentIndex == index
                    ? colorScheme.primary
                    : Colors.black26,
                fontSize: 12,
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
