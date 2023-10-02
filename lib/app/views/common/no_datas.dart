import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NoDatas extends StatelessWidget {
  NoDatas({Key? key, required this.text}) : super(key: key);
  String text;

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
                      color: Color.fromARGB(255, 154, 154, 154)))
            ],
          )
        ],
      ),
    );
  }
}
