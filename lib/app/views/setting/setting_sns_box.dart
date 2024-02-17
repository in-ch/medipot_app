import 'package:flutter/material.dart';

class SettingSnsBoxItem extends StatefulWidget {
  static const Color defaultBackgroundColor = Color(0xff191A1F);

  const SettingSnsBoxItem(
      {Key? key, required this.text, required this.onTap, required this.img})
      : super(key: key);

  final String text;
  final void Function() onTap;
  final String img;

  @override
  State<SettingSnsBoxItem> createState() => _SettingSnsBoxState();
}

class _SettingSnsBoxState extends State<SettingSnsBoxItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            SizedBox(
              width: 25,
              height: 25,
              child: Image(
                image: AssetImage(widget.img),
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(width: 15),
            Text(widget.text, style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
      ),
    );
  }
}
