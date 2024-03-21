import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:medipot_app/data/models/models.dart';

class UserService {
  static Future<Map<String, dynamic>> me() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString("accessToken").toString();
    String apiServer = dotenv.get("API_SERVER");
    final url = Uri.parse('$apiServer/user/me');
    final headers = {'Authorization': 'Bearer $accessToken'};
    final response = await http.post(url, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to user me');
    }
  }

  static Future<ApiResponse<MeUser>> getMe() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString("accessToken").toString();
    String apiServer = dotenv.get("API_SERVER");
    final url = Uri.parse('$apiServer/user/me');
    final headers = {'Authorization': 'Bearer $accessToken'};
    final response = await http.post(url, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return ApiResponse.fromJson(
        jsonDecode(response.body),
        (data) => MeUser.fromJson(data),
      );
    } else {
      throw Exception('Failed to user get me');
    }
  }

  static Future<void> refresh() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String refreshToken = prefs.getString("refreshToken").toString();
    String userNo = prefs.getString("userNo").toString();
    String apiServer = dotenv.get("API_SERVER");

    final url = Uri.parse('$apiServer/user/refresh');
    final body = {"no": int.parse(userNo), "refresh_token": refreshToken};
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(body));
    final dataRefresh = jsonDecode(response.body);
    if (dataRefresh["statusCode"] == 200) {
      String authorization =
          Refresh.fromJson(dataRefresh["data"]).authorization;
      prefs.setString("accessToken", authorization);
    } else {
      throw Exception('Failed to user refresh');
    }
  }

  static Future<bool> deleteAccount() async {
    String apiServer = dotenv.get("API_SERVER");
    final url = Uri.parse('$apiServer/user/delete');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');
    final headers = {'Authorization': 'Bearer $accessToken'};
    final response = await http.delete(url, headers: headers);
    final responseData = jsonDecode(response.body);
    final apiResponse = ApiResponse.fromJson(
      responseData,
      (data) => User.fromJson(data),
    );
    return apiResponse.statusCode == 200;
  }

  static Future<bool> checkDuplicationNickname(String nickname) async {
    String apiServer = dotenv.get("API_SERVER");
    final url = Uri.parse('$apiServer/auth/nickname/validation');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');
    final headers = {'Authorization': 'Bearer $accessToken'};
    final response =
        await http.post(url, headers: headers, body: ({"nickname": nickname}));
    final responseData = jsonDecode(response.body);

    return responseData["statusCode"] == 200;
  }

  static Future<bool> updateProfile(String nickname, String img) async {
    String apiServer = dotenv.get("API_SERVER");
    final url = Uri.parse('$apiServer/user/profile/update');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');
    final headers = {'Authorization': 'Bearer $accessToken'};
    final body = {"nickname": nickname};
    if (img != "") {
      body["profile"] = img;
    }

    final response = await http.post(url, headers: headers, body: body);
    final responseData = jsonDecode(response.body);

    return responseData["statusCode"] == 200;
  }

  static Future<bool> sendValidationCode(String phone) async {
    String apiServer = dotenv.get("API_SERVER");
    final url = Uri.parse('$apiServer/auth/phone/validation/send');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');
    final headers = {'Authorization': 'Bearer $accessToken'};
    final body = {"phone": "01056922949"};

    final response = await http.post(url, headers: headers, body: body);
    final responseData = jsonDecode(response.body);

    return responseData["statusCode"] == 200;
  }
}
