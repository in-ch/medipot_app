import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:docspot_app/data/models/models.dart';

class LoginService {
  static Future<void> loginApi(String accessToken) async {
    final Map<String, dynamic> payload = {
      'authorization': accessToken,
    };
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    String apiServer = dotenv.get("API_SERVER");
    final url = Uri.parse('$apiServer/kakao/login');

    final response =
        await http.post(url, headers: headers, body: jsonEncode(payload));
    final responseData = jsonDecode(response.body);
    final apiResponse = ApiResponse.fromJson(
      responseData,
      (data) => LoginUserData.fromJson(data),
    );
    if (apiResponse.statusCode == 200) {
      LoginUserData data = apiResponse.data;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLogin', true);
      prefs.setString('nickname', data.nickname);
      prefs.setString('userNo', data.no.toString());
      prefs.setString('phone', data.phone);
      prefs.setString('accessToken', data.token);
      prefs.setString('refreshToken', data.refreshToken);
      prefs.setString('grant', data.grant);
    } else {
      throw Exception('Failed login API');
    }
  }

  static Future<void> appleLoginApi(
      String accessToken, String email, String userIdentifier) async {
    final Map<String, dynamic> payload = {
      'userIdentifier': userIdentifier,
      'email': email,
    };
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    String apiServer = dotenv.get("API_SERVER");
    final url = Uri.parse('$apiServer/apple/login');

    final response =
        await http.post(url, headers: headers, body: jsonEncode(payload));
    final responseData = jsonDecode(response.body);
    final apiResponse = ApiResponse.fromJson(
      responseData,
      (data) => LoginUserData.fromJson(data),
    );
    if (apiResponse.statusCode == 200) {
      LoginUserData data = apiResponse.data;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLogin', true);
      prefs.setString('nickname', data.nickname);
      prefs.setString('userNo', data.no.toString());
      prefs.setString('phone', data.phone);
      prefs.setString('accessToken', data.token);
      prefs.setString('refreshToken', data.refreshToken);
      prefs.setString('grant', data.grant);
    } else {
      throw Exception('Failed login API');
    }
  }
}
