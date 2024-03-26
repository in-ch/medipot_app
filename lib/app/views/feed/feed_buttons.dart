import 'package:flutter/material.dart';

import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/data/models/models.dart';

class FeedButtons extends StatefulWidget {
  const FeedButtons({super.key, required this.writing});

  final Writing writing;

  @override
  State<FeedButtons> createState() => _FeedButtonsState();
}

class _FeedButtonsState extends State<FeedButtons> {
  @override
  Widget build(BuildContext context) {
    int likeCount = widget.writing.like.length;
    int replyCount = widget.writing.reply.length;

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
              size: 15,
              color: colorScheme.primary,
            ),
            const SizedBox(width: 6),
            Text(likeCount.toString(),
                style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(width: 15),
            const Icon(
              Icons.chat_bubble_outline,
              size: 15,
              color: Colors.black26,
            ),
            const SizedBox(width: 6),
            Text(replyCount.toString(),
                style: Theme.of(context).textTheme.bodySmall)
          ],
        ),
      ),
    );
  }
}
