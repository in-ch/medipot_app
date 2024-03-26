import 'package:flutter/material.dart';

import 'package:docspot_app/app/style/theme.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({super.key, required this.text, required this.event});

  final String text;
  final void Function() event;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: event,
      child: Text(text, style: appTheme.textTheme.bodySmall),
    );
  }
}
