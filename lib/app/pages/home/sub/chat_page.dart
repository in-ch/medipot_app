import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';

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
          actions: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(width: 10),
            const Text("100명", style: TextStyle(color: Colors.white)),
            const SizedBox(width: 10),
          ],
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 39, 39, 39),
          elevation: 0,
        ),
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        body: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 55, 55, 55),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 4.0, bottom: 4.0),
                    child: Text(
                      "모든 메시지는 00:00시에 초기화됩니다.",
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: Obx(() {
                      return ListView.builder(
                        reverse: true,
                        itemCount: controller.messages.length,
                        itemBuilder: (context, index) {
                          final message = controller.messages[index];
                          final isMyMessage =
                              message.senderId == controller.userId;
                          final formattedTime =
                              DateFormat('a hh:mm').format(message.timestamp);

                          return GestureDetector(
                            onLongPress: () => message.imagePath != null
                                ? debugPrint('image message long pressed!')
                                : controller.longPressFuc(context, message,
                                    message.imagePath == null),
                            child: Align(
                              alignment: isMyMessage
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: isMyMessage
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    padding: EdgeInsets.all(
                                        message.imagePath != null ? 0 : 10),
                                    decoration: BoxDecoration(
                                      color: isMyMessage
                                          ? colorScheme.primary
                                          : const Color.fromARGB(
                                              255, 56, 56, 56),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: message.imagePath != null
                                        ? GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                barrierColor: Colors.black87,
                                                builder:
                                                    (BuildContext context) {
                                                  return Dialog(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.all(
                                                              20),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image.file(
                                                          File(message
                                                              .imagePath!),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: SizedBox(
                                                width: 180,
                                                child: Image.file(
                                                  File(message.imagePath!),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Text(
                                            message.content,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                  ),
                                  Padding(
                                    padding: isMyMessage
                                        ? const EdgeInsets.only(right: 20.0)
                                        : const EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      formattedTime,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  ),
                                  const SizedBox(height: 8)
                                ],
                              ),
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
                          focusNode: _focusNode,
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
            Obx(
              () => !controller.isLogin.value
                  ? Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Container(
                          color: Colors.black.withOpacity(0.3),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "로그인이 필요합니다.",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "로그인 및 인증 후 실시간 채팅 기능을 이용해보세요.",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 10),
                                CommonButton(
                                  onClick: () {
                                    controller.goToLogin(context);
                                  },
                                  text: "로그인하러 가기",
                                  isReverse: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
