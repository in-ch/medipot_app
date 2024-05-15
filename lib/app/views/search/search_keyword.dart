import 'package:flutter/material.dart';

class SearchKeyword extends StatelessWidget {
  const SearchKeyword({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, right: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: const Color.fromARGB(66, 162, 162, 162)),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 8, right: 8, top: 4.0, bottom: 4.0),
          child: Text(text,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 14,
                  color: const Color.fromARGB(255, 140, 140, 140))),
        ),
      ),
    );
  }
}
