import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LocationService {
  static Future<int> requestPremiumReport(int locationNo) async {
    String apiServer = dotenv.get("API_SERVER");
    final url = Uri.parse('$apiServer/question/detail/add');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');
    final headers = {'Authorization': 'Bearer $accessToken'};
    final body = {"locationNo": locationNo.toString()};
    final response =
        await http.post(url, headers: headers, body: jsonEncode(body));
    final responseData = jsonDecode(response.body);
    return responseData["statusCode"];
  }
}
