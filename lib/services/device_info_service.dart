import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class DeviceInfoService {
  static Future<bool> insertDeviceInfo(String fcmToken) async {
    String apiServer = dotenv.get("API_SERVER");
    Map<String, dynamic> body = {
      'fcmToken': fcmToken,
    };
    final url = Uri.parse('$apiServer/deviceInfo');
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(body));
    final responseData = jsonDecode(response.body);
    return responseData["statusCode"] == 200;
  }
}
