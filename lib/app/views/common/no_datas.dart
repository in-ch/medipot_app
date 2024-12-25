import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NoDatas extends StatelessWidget {
  NoDatas({super.key, required this.text, this.sub = ""});
  String text;
  String? sub;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 150, 150, 150),
                      fontWeight: FontWeight.w400)),
              sub != ""
                  ? Column(
                      children: [
                        const SizedBox(height: 5),
                        Text(sub!,
                            style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 154, 154, 154)))
                      ],
                    )
                  : const SizedBox(),
              const SizedBox(height: 50),
            ],
          )
        ],
      ),
    );
  }
}
