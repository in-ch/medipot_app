import 'package:flutter/material.dart';

import 'package:docspot_app/app/style/theme.dart';

class SettingBoxItem extends StatefulWidget {
  static const Color defaultBackgroundColor =
      Color.fromARGB(255, 240, 240, 240);

  const SettingBoxItem({
    super.key,
    required this.title,
    required this.description,
    required this.event,
    this.backgroundColor = defaultBackgroundColor,
  });

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
              height: 65,
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: appTheme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.title,
                    style: appTheme.textTheme.bodySmall,
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
