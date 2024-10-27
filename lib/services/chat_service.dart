import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:docspot_app/data/models/models.dart';

class ChatService {
  static Future<List<ChatMessage>> getMessages() async {
    String apiServer = dotenv.get("WEB_SOCKET_SERVICE");
    final url = Uri.parse('$apiServer/chat/messages');
    final response = await http.get(url);
    List<dynamic> jsonResponse = jsonDecode(response.body);
    return jsonResponse.map((data) => ChatMessage.fromJson(data)).toList();
  }

  static Future<void> saveLastChatTimestamp(int userNo) async {
    String apiServer = dotenv.get("WEB_SOCKET_SERVICE");
    final url = Uri.parse('$apiServer/chat/save-last-timestamp');
    await http.post(url, body: {'userNo': userNo.toString()});
  }
}
