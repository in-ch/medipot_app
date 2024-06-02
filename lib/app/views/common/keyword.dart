import 'package:flutter/material.dart';

class Keyword extends StatelessWidget {
  const Keyword({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, right: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 235, 235, 235),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 6, right: 6, top: 2.0, bottom: 2.0),
          child: Text(text),
        ),
      ),
    );
  }
}
