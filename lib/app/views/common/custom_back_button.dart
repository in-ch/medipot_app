import 'package:flutter/cupertino.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        color: const Color.fromRGBO(255, 255, 255, 0),
        width: 60,
        height: 60,
        child: const Icon(CupertinoIcons.back),
      ),
    );
  }
}
