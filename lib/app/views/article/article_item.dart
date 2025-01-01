import 'dart:math';
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

  // 랜덤 색상 생성
  Color _generateRandomColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(156),
      random.nextInt(156),
      random.nextInt(156),
      1.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = _generateRandomColor();
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.articleDetail, arguments: {'no': no}),
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
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
                removeHtmlTags(
                    contentKr.replaceAll("```", "").replaceAll("html", "")),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
