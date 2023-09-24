import 'package:flutter/material.dart';

import 'package:medipot_app/app/style/theme.dart';

class Tag extends StatelessWidget {
  const Tag({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0, right: 5.0),
      child: Theme(
        data: appTheme,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent, // 색상 비어있음
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: colorScheme.primary, // border 색상
              width: 1.1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 5.0, bottom: 4.0, left: 8.0, right: 8.0),
            child: Text(
              text,
              style: TextStyle(
                  color: colorScheme.primary,
                  fontSize: 9,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
      ),
    );
  }
}
