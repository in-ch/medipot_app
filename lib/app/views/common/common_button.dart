import 'package:docspot_app/app/style/theme.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton(
      {super.key,
      required this.text,
      this.isHighlight = false,
      this.isReverse = false,
      required this.onClick});

  final String text;
  final bool isHighlight;
  final Function onClick;
  final bool isReverse;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 150), // 최대 너비 지정
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: isReverse ? colorScheme.primary : Colors.transparent,
              border: Border.all(
                  color: isHighlight
                      ? colorScheme.primary
                      : isReverse
                          ? colorScheme.primary
                          : Colors.black26),
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(text,
                    style: TextStyle(
                        fontSize: 12,
                        color: isHighlight
                            ? colorScheme.primary
                            : isReverse
                                ? Colors.white
                                : Colors.black)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
