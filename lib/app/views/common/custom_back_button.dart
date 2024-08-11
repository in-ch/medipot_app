import 'package:flutter/cupertino.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: const SizedBox(
        width: 40,
        height: 40,
        child: Icon(CupertinoIcons.back),
      ),
    );
  }
}
