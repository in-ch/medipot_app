import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String text;

  const Label(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            height: 0.8,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6)));
  }
}
