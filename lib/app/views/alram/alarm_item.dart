import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AlarmItem extends StatelessWidget {
  final String title;
  final String body;
  final String page;
  final int pageNo;
  final DateTime createdAt;

  const AlarmItem({
    super.key,
    required this.title,
    required this.body,
    required this.page,
    required this.pageNo,
    required this.createdAt,
  });

  String _timeDifference(DateTime createdAt) {
    final now = DateTime.now();
    final difference = now.difference(createdAt);
    if (difference.inDays >= 365) {
      final dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
      return dateFormat.format(createdAt);
    } else if (difference.inDays >= 30) {
      final months = (difference.inDays / 30).floor();
      return '$months달 전';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}일 전';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}시간 전';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}분 전';
    } else {
      return '방금 전';
    }
  }

  bool _isNew(DateTime createdAt) {
    final now = DateTime.now();
    final difference = now.difference(createdAt);
    return difference.inDays < 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color.fromARGB(255, 220, 220, 220)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: GestureDetector(
          onTap: () => Get.toNamed(page, arguments: {'no': pageNo}),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_isNew(createdAt))
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                  margin: const EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 57, 63, 255),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'NEW',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0),
                  ),
                ),
              Text(title,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w300)),
              const SizedBox(height: 3),
              Text(body, style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 5),
              Text(
                _timeDifference(createdAt),
                style:
                    const TextStyle(color: Color.fromARGB(255, 150, 150, 150)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
