import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:docspot_app/data/models/models.dart';

class ChatController extends GetxController {
  final String userId = 'user123';
  final ImagePicker _picker = ImagePicker();
  var messages = <ChatMessage>[].obs;
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

  void sendMessage(String content, {String? imagePath}) {
    final newMessage = ChatMessage(
      senderId: userId,
      content: content,
      imagePath: imagePath,
      timestamp: DateTime.now(),
    );

    // 예시: sendMessageToServer(newMessage);
    messages.insert(0, newMessage);
  }

  void copyMessage(String messageContent) {
    Clipboard.setData(ClipboardData(text: messageContent));
    Get.snackbar("복사 완료", "메시지가 클립보드에 복사되었습니다.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black54,
        colorText: Colors.white);
  }

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      sendMessage('image message', imagePath: image.path);
    }
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
    messageController.dispose();
    super.onClose();
  }
}
