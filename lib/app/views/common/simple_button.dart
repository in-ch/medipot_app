import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton(
      {super.key,
      required this.text,
      required this.color,
      required this.textColor,
      required this.event,
      this.isBookmark = false});

  final String text;
  final Color color;
  final Color textColor;
  final bool isBookmark;
  final void Function() event;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        child: ElevatedButton(
            onPressed: event,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(color),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: const BorderSide(
                      color: Color.fromARGB(96, 227, 227, 227)),
                ),
              ),
            ),
            child: isBookmark
                ? const Icon(CupertinoIcons.bookmark, color: Colors.black)
                : Text(
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: textColor),
                  )));
  }
}
