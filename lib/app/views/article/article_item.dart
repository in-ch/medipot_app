import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/routes/routes.dart';
import 'package:docspot_app/app/utils/utils.dart';

class ArticleItem extends StatelessWidget {
  final String titleKr;
  final String contentKr;
  final String img;
  final String date;
  final int no;

  const ArticleItem({
    super.key,
    required this.titleKr,
    required this.contentKr,
    required this.img,
    required this.date,
    required this.no,
  });

  Color _generateRandomColor(int no) {
    int r = (no * 37) % 156;
    int g = (no * 59) % 156;
    int b = (no * 83) % 156;
    return Color.fromRGBO(r, g, b, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = _generateRandomColor(no);
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.articleDetail, arguments: {'no': no}),
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 137, 137, 137)
                ..withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Text(
                titleKr,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                removeHtmlTags(contentKr
                    .replaceAll("```", "")
                    .replaceAll("html", "")
                    .replaceAll("  ", "")),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
