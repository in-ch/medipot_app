import 'package:flutter/material.dart';

import 'package:docspot_app/app/style/theme.dart';

class BigTag extends StatelessWidget {
  const BigTag({super.key, required this.text, this.disabled = false});
  final String text;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0, right: 5.0),
      child: Theme(
        data: appTheme,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent, // 색상 비어있음
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: disabled
                  ? const Color.fromARGB(255, 203, 203, 203)
                  : colorScheme.primary, // border 색상
              width: 2.1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 5.0, bottom: 4.0, left: 8.0, right: 8.0),
            child: Text(
              text,
              style: TextStyle(
                  color: disabled
                      ? const Color.fromARGB(255, 203, 203, 203)
                      : colorScheme.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
