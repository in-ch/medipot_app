import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/data/models/models.dart';

class ChatController extends GetxController {
  final String userId = 'user123';

  var messages = <ChatMessage>[].obs;

  // 메시지 입력 필드 제어용 TextEditingController
  final TextEditingController messageController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _addMockMessages();
  }

  void _addMockMessages() {
    messages.addAll([
      ChatMessage(
          senderId: 'user456',
          content: '안녕하세요!',
          timestamp: DateTime.now().subtract(const Duration(minutes: 5))),
      ChatMessage(
          senderId: 'user789',
          content: '채팅 시작해요!',
          timestamp: DateTime.now().subtract(const Duration(minutes: 3))),
      ChatMessage(
          senderId: 'user456',
          content: '어떻게 지내세요?',
          timestamp: DateTime.now().subtract(const Duration(minutes: 2))),
      ChatMessage(
          senderId: 'user123',
          content: '저는 잘 지내요. 당신은요?',
          timestamp: DateTime.now().subtract(const Duration(minutes: 1))),
      ChatMessage(
          senderId: 'user789',
          content: '잘 지내고 있어요. 고마워요!',
          timestamp: DateTime.now()),
    ]);
  }

  void sendMessage(String content) {
    final newMessage = ChatMessage(
      senderId: userId,
      content: content,
      timestamp: DateTime.now(),
    );

    messages.insert(0, newMessage);

    // 서버와 통신하여 메시지를 실제로 전송하는 로직이 들어가야 함
    // 예시: sendMessageToServer(newMessage);
  }

  void receiveMessage(String senderId, String content) {
    final newMessage = ChatMessage(
      senderId: senderId,
      content: content,
      timestamp: DateTime.now(),
    );
    messages.insert(0, newMessage);
  }

  @override
  void onClose() {
    messageController.dispose(); // 컨트롤러 해제
    super.onClose();
  }
}
