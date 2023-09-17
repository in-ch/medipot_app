import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medipot_app/data/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  static Future<void> kakaoLoginApi(String accessToken) async {
    final Map<String, dynamic> payload = {
      'authorization': accessToken,
    };
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };

    final url = Uri.parse('https://medipod.shop/kakao/login');

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
      prefs.setString('profile', data.profile);
      prefs.setString('userNo', data.no.toString());
      prefs.setString('phone', data.phone);
      prefs.setString('accessToken', data.token);
      prefs.setString('refreshToken', data.refreshToken);
    } else {
      throw Exception('Failed kakao login API');
    }
  }
}
