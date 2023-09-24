import 'package:flutter/material.dart';
import 'package:medipot_app/app/views/views.dart';

class Tags extends StatelessWidget {
  const Tags({super.key, required this.tags, required this.isDetail});

  final List<String> tags;
  final bool isDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
        right: 10,
        left: isDetail ? 10 : 52,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 20,
        child: Wrap(
          alignment: WrapAlignment.start,
          spacing: 10,
          children: tags.map((tag) => Tag(text: tag)).toList(),
        ),
      ),
    );
  }
}
