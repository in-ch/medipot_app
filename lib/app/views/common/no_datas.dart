import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NoDatas extends StatelessWidget {
  NoDatas({Key? key, required this.text, this.sub = ""}) : super(key: key);
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
                      fontSize: 18,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w600)),
              sub != ""
                  ? Column(
                      children: [
                        const SizedBox(height: 5),
                        Text(sub!,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 154, 154, 154)))
                      ],
                    )
                  : const SizedBox(),
            ],
          )
        ],
      ),
    );
  }
}
