import 'package:flutter/material.dart';
import 'package:medipot_app/style/theme.dart';

class FeedButtons extends StatefulWidget {
  const FeedButtons({super.key});

  @override
  State<FeedButtons> createState() => _FeedButtonsState();
}

class _FeedButtonsState extends State<FeedButtons> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appTheme,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 30,
        child: Row(
          children: [
            const SizedBox(width: 5),
            Icon(
              Icons.thumb_up,
              size: 20,
              color: colorScheme.primary,
            ),
            const SizedBox(width: 6),
            Text("10", style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(width: 15),
            const Icon(
              Icons.chat_bubble_outline,
              size: 20,
              color: Colors.black26,
            ),
            const SizedBox(width: 6),
            Text("10", style: Theme.of(context).textTheme.bodySmall)
          ],
        ),
      ),
    );
  }
}
