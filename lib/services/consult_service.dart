import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ConsultService {
  static Future<Map<String, dynamic>> getMyConsults() async {
    String apiServer = dotenv.get("API_SERVER");
    final url = Uri.parse('$apiServer/consult/list');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');
    final headers = {'Authorization': 'Bearer $accessToken'};

    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {'statusCode': response.statusCode, 'data': []};
    }
  }
}
