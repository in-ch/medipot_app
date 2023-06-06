import 'package:flutter/material.dart';

class Hr extends StatelessWidget {
  const Hr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 10,
        color: const Color.fromARGB(255, 236, 236, 236));
  }
}
