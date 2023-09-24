import 'package:flutter/material.dart';

import 'package:medipot_app/app/style/theme.dart';
import 'package:medipot_app/app/views/views.dart';
import 'package:medipot_app/data/models/models.dart';

class MyConsultItem extends StatefulWidget {
  final Consult consult;

  const MyConsultItem({
    Key? key,
    required this.consult,
  }) : super(key: key);

  @override
  State<MyConsultItem> createState() => _MyConsultItemState();
}

class _MyConsultItemState extends State<MyConsultItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 8.0, right: 8.0),
            child: Container(
              color: Colors.white,
              width: double.infinity,
              height: 140,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigTag(text: widget.consult.type),
                      const SizedBox(height: 5),
                      Text(
                          widget.consult.detail
                              .replaceAll("<p>", "")
                              .replaceAll("</p>", ""),
                          style: appTheme.textTheme.bodyLarge),
                      const SizedBox(height: 2),
                      Text(widget.consult.name,
                          style: appTheme.textTheme.bodyMedium),
                      const SizedBox(height: 20),
                      Text(widget.consult.createdAt.split("T")[0],
                          style: appTheme.textTheme.titleSmall),
                    ],
                  ),
                  SizedBox(
                    width: 100,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BigTag(
                          text: "미답변",
                          disabled: !widget.consult.isDone,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
              width: double.infinity,
              height: 3,
              color: const Color.fromARGB(255, 217, 217, 217))
        ],
      ),
    );
  }
}
