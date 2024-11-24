import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';

class ChatTextarea extends StatelessWidget {
  ChatTextarea({super.key, required this.controller});

  ChatController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color.fromARGB(255, 45, 45, 45),
          child: Row(
            children: [
              const SizedBox(width: 10),
              SizedBox(
                  width: 20,
                  child: InkWell(
                    onTap: () {
                      controller.pickImage();
                    },
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: const Icon(
                      CupertinoIcons.add,
                      color: Color.fromARGB(255, 125, 125, 125),
                    ),
                  )),
              Expanded(
                child: TextField(
                  controller: controller.messageController,
                  minLines: 1,
                  maxLines: 3,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: '',
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: const Icon(Icons.send),
                color: colorScheme.primary,
                onPressed: () {
                  if (controller.messageController.text.isNotEmpty) {
                    controller.sendMessage(controller.messageController.text);
                    controller.messageController.clear();
                  }
                },
              ),
            ],
          ),
        ),
        Container(
          height: GetPlatform.isIOS ? 20 : 10,
          color: const Color.fromARGB(255, 45, 45, 45),
        ),
      ],
    );
  }
}
