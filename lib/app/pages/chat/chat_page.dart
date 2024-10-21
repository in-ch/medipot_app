import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({super.key});

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
                              message.author == controller.userId;
                          final formattedTime =
                              DateFormat('a hh:mm').format(message.timestamp);

                          return ChatItem(
                            message: message,
                            isMy: isMyMessage,
                            formattedTime: formattedTime,
                            longPressFuc: (context) => controller.longPressFuc(
                                context, message, message.img == null),
                          );
                        },
                      );
                    }),
                  ),
                ),
                ChatTextarea(controller: controller)
              ],
            ),
            Obx(
              () => !controller.isLogin.value
                  ? ChatPleaseLoginFilter(
                      goToLogin: () => controller.goToLogin(context),
                    )
                  : Container(),
            ),
            Obx(
              () => controller.isLogin.value && !controller.isGranted.value
                  ? ChatPleaseGrantFilter(
                      goToGrant: () => controller.goToGrant(context),
                    )
                  : Container(),
            )
          ],
        ),
      ),
    );
  }
}
