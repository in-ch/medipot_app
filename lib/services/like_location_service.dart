import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LikeLocationService {
  static Future<Map<String, dynamic>> getLikeLocations() async {
    final url = Uri.parse('http://localhost:4000/likeLocation');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');
    final headers = {'Authorization': 'Bearer $accessToken'};

    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to likeLocations fetch list');
    }
  }

  static Future<Map<String, dynamic>> likeLocation(dynamic locationNo) async {
    final url = Uri.parse('http://localhost:4000/likeLocation');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');
    final headers = {'Authorization': 'Bearer $accessToken'};

    final response = await http.post(url,
        headers: headers, body: {'locationNo': locationNo.toString()});
    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> unlikeLocation(dynamic locationNo) async {
    final url = Uri.parse('http://localhost:4000/likeLocation');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');
    final headers = {'Authorization': 'Bearer $accessToken'};
    final body = {"locationNo": locationNo};
    final response =
        await http.delete(url, headers: headers, body: jsonEncode(body));
    return jsonDecode(response.body);
  }
}
