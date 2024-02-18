import 'package:flutter/material.dart';

class AccordionWidget extends StatefulWidget {
  const AccordionWidget(
      {super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  AccordionWidgetState createState() => AccordionWidgetState();
}

class AccordionWidgetState extends State<AccordionWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.white,
          child: ListTile(
            tileColor: Colors.white,
            title: Text(widget.title),
            trailing: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          ),
        ),
        const Divider(
          height: 1,
          color: Color.fromARGB(31, 150, 150, 150),
        ),
        if (_isExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: const Color.fromARGB(255, 245, 245, 245),
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 20.0, bottom: 20.0),
                  child: Text(widget.description),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
