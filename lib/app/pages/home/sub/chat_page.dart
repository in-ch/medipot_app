import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';

class ChatSubPage extends GetView<ChatController> {
  const ChatSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appTheme,
      child: Scaffold(
          appBar: AppBar(
              title: Text(
                "실시간 채팅",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0),
          body: const Column(
            children: [
              Expanded(
                  child: Column(
                children: [Text('Hello world')],
              ))
            ],
          )),
    );
  }
}
