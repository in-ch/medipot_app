import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import 'package:docspot_app/app/constants/constants.dart';
import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/services/services.dart';
import 'package:docspot_app/app/views/views.dart';

class ChatController extends GetxController {
  String userId = 'user';
  final ImagePicker _picker = ImagePicker();
  var messages = <ChatMessage>[].obs;
  final TextEditingController messageController = TextEditingController();
  RxBool isLogin = false.obs;
  RxBool isGranted = false.obs;
  RxBool isLicenseUploadLoading = false.obs;
  late io.Socket socket;

  @override
  void onInit() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isLogin.value = prefs.getBool("isLogin") ?? false;
    String userNo = prefs.getString("userNo").toString();
    String? grantValue = prefs.getString("grant");
    isGranted.value = grantValue == Grant.DOCTOR.value;
    userId = userNo;
    _connectToWebSocket();
    super.onInit();
    _getMessages();
  }

  void _connectToWebSocket() {
    socket = io.io(dotenv.get("WEB_SOCKET_SERVICE"), <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.connect();
    socket.onConnect((_) {
      debugPrint('WebSocket에 접속하였습니다.');
      socket.on('chat', (data) {
        debugPrint('메시지를 받았습니다.: $data');
        final author = data['author'] ?? 'Unknown 유저';
        final body = data['body'] ?? '';
        final img = data['img'];
        final userNo = data['userNo'];
        final profile = data['profile'];

        receiveMessage(author, body, img, userNo, profile);
      });
    });
    socket.onDisconnect((_) {
      debugPrint('WebSocket와의 연결을 종료하였습니다.');
    });
  }

  void _getMessages() async {
    List<ChatMessage> chatMessages = await ChatService.getMessages();
    messages.addAll(chatMessages);
  }

  void sendMessage(String body, {String? imagePath}) {
    final newMessage = ChatMessage(
      author: '',
      userNo: int.parse(userId),
      body: body,
      img: imagePath,
      timestamp: DateTime.now(),
    );
    socket.emit('chat', newMessage.toJson());
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

  void receiveMessage(
      String author, String body, String? img, int userNo, String profile) {
    if (userNo == int.parse(userId)) {
      return;
    }
    final newMessage = ChatMessage(
        author: author,
        body: body,
        img: img,
        userNo: userNo,
        timestamp: DateTime.now(),
        profile: profile);
    messages.insert(0, newMessage);
  }

  void longPressFuc(BuildContext context, ChatMessage message, bool isTextMsg) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return MessageClipBoardModal(
            text: isTextMsg ? '복사하기' : '저장하기',
            onTap: () {
              isTextMsg ? copyMessage(message.body) : saveImage(message.img);
              Navigator.pop(context);
            });
      },
    );
  }

  Future<void> saveImage(String? imagePath) async {
    try {
      if (imagePath == null) {
        Get.snackbar(
          '오류 발생',
          '저장할 이미지가 없습니다.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }
      final directory = await getApplicationDocumentsDirectory();
      final String fileName = "${DateTime.now().millisecondsSinceEpoch}.jpg";
      final File newImage = File('${directory.path}/$fileName');
      await File(imagePath).copy(newImage.path);

      Get.snackbar('이미지 저장', '이미지가 저장되었습니다. ${newImage.path}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (e) {
      Get.snackbar('이미지 저장이 실패하였습니다.', '잠시 후 다시 시도해주세요.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void goToLogin(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return LoginModal();
      },
    );
  }

  void goToGrant(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return GrantModal();
      },
    );
  }

  Future<void> uploadLicense(BuildContext context) async {
    isLicenseUploadLoading.value = true;
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    final UploadService uploadService = UploadService();

    if (image != null) {
      final file = File(image.path);
      await uploadService.uploadFile(file);
      Get.snackbar("인증 신청이 완료되었습니다.", "인증 완료 후 알림을 보내드립니다.");
    }
    Navigator.pop(context);
    isLicenseUploadLoading.value = false;
    update();
  }

  @override
  void onClose() {
    messageController.dispose();
    isLogin.value = false;
    isGranted.value = false;
    socket.dispose();
    update();
    super.onClose();
  }
}
