import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';

class ChatSubPage extends StatefulWidget {
  const ChatSubPage({super.key});

  @override
  State<ChatSubPage> createState() => _ChatSubPageState();
}

class _ChatSubPageState extends State<ChatSubPage> {
  final ChatController controller = Get.put(ChatController());
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appTheme,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "실시간 채팅",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 39, 39, 39),
          elevation: 0,
        ),
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        // GestureDetector 추가하여 다른 부분을 클릭할 때 포커스를 해제
        body: Column(
          children: [
            // 채팅 메시지를 표시하는 부분
            Expanded(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Obx(() {
                  return ListView.builder(
                    reverse: true, // 최근 메시지를 위쪽에 배치
                    itemCount: controller.messages.length,
                    itemBuilder: (context, index) {
                      final message = controller.messages[index];
                      final isMyMessage = message.senderId == controller.userId;
                      return Align(
                        alignment: isMyMessage
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isMyMessage
                                ? colorScheme.primary
                                : const Color.fromARGB(255, 56, 56, 56),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(message.content,
                              style: const TextStyle(color: Colors.white)),
                        ),
                      );
                    },
                  );
                }),
              ),
            ),

            // 메시지 입력 필드 및 전송 버튼
            Container(
              color: const Color.fromARGB(255, 45, 45, 45),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 20,
                    child: IconButton(
                      icon: const Icon(CupertinoIcons.add),
                      color: const Color.fromARGB(255, 125, 125, 125),
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      focusNode: _focusNode, // FocusNode 연결
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
                        controller
                            .sendMessage(controller.messageController.text);
                        controller.messageController.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose(); // FocusNode 해제
    super.dispose();
  }
}
