import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LikeLocationService {
  static Future<Map<String, dynamic>> getLikeLocations() async {
    String apiServer = dotenv.get("API_SERVER");
    final url = Uri.parse('$apiServer/likeLocation');
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

  static Future<Map<String, dynamic>> likeLocation(dynamic locationNo) async {
    String apiServer = dotenv.get("API_SERVER");
    final url = Uri.parse('$apiServer/likeLocation');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');
    final headers = {'Authorization': 'Bearer $accessToken'};

    final response = await http.post(url,
        headers: headers, body: {'locationNo': locationNo.toString()});
    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> unlikeLocation(dynamic locationNo) async {
    String apiServer = dotenv.get("API_SERVER");
    final url = Uri.parse('$apiServer/likeLocation');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');
    final headers = {'Authorization': 'Bearer $accessToken'};
    final body = {"locationNo": locationNo};
    final response =
        await http.delete(url, headers: headers, body: jsonEncode(body));
    return jsonDecode(response.body);
  }
}
