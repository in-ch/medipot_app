import 'package:flutter/material.dart';

class MessageClipBoardModal extends StatelessWidget {
  const MessageClipBoardModal(
      {super.key, required this.onTap, required this.text});

  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 55, 55, 55),
      child: Wrap(
        children: [
          ListTile(
              leading: const Icon(Icons.copy, color: Colors.white),
              title: Text(text, style: const TextStyle(color: Colors.white)),
              onTap: () => onTap()),
          const SizedBox(height: 100)
        ],
      ),
    );
  }
}
