import 'package:docspot_app/app/style/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton(
      {super.key,
      required this.text,
      required this.color,
      required this.textColor,
      required this.event,
      this.isBookmark = false,
      this.isActive = false});

  final String text;
  final Color color;
  final Color textColor;
  final bool isBookmark;
  final bool isActive;
  final void Function() event;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        child: ElevatedButton(
            onPressed: event,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(color),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: const BorderSide(
                      color: Color.fromARGB(96, 227, 227, 227)),
                ),
              ),
            ),
            child: isBookmark
                ? Opacity(
                    opacity: 1,
                    child: Icon(
                        isActive
                            ? CupertinoIcons.bookmark_fill
                            : CupertinoIcons.bookmark,
                        color: colorScheme.primary))
                : Text(
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: textColor),
                  )));
  }
}
