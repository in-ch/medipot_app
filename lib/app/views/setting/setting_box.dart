import 'package:flutter/material.dart';

import 'package:medipot_app/app/style/theme.dart';

class SettingBoxItem extends StatefulWidget {
  static const Color defaultBackgroundColor =
      Color.fromARGB(255, 240, 240, 240);

  const SettingBoxItem({
    Key? key,
    required this.title,
    required this.description,
    required this.event,
    this.backgroundColor = defaultBackgroundColor,
  }) : super(key: key);

  final String title;
  final String description;
  final void Function() event;
  final Color backgroundColor;

  @override
  State<SettingBoxItem> createState() => _SettingBoxState();
}

class _SettingBoxState extends State<SettingBoxItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: widget.event,
          child: Container(
              height: 60,
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
              width: double.maxFinite,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: SizedBox(
                      height: 24,
                      child: Text(
                        widget.title,
                        style: appTheme.textTheme.titleMedium,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 34,
                    bottom: 0,
                    left: 0,
                    child: Text(
                      widget.description,
                      style: appTheme.textTheme.titleSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )),
        ),
        const Divider(
          height: 1,
          color: Colors.black12,
        )
      ],
    );
  }
}
