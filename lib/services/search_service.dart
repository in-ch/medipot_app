import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class SearchService {
  static Future<Map<String, dynamic>> getSearchRank() async {
    String apiServer = dotenv.get("API_SERVER");
    final url = Uri.parse('$apiServer/search/list');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {'statusCode': response.statusCode, 'data': []};
    }
  }
}
