import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class CareerService {
  static Future<Map<String, dynamic>> getCareers() async {
    String apiServer = dotenv.get("API_SERVER");

    final url = Uri.parse('$apiServer/career/list');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {'statusCode': response.statusCode, 'data': []};
    }
  }
}
