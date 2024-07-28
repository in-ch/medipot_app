import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:docspot_app/app/constants/constants.dart';

class CareerService {
  static Future<Map<String, dynamic>> getCareers(
      int page,
      int limit,
      String title,
      String detail,
      String invitedSubject,
      String hospitalName,
      String hospitalLocation,
      String keyword) async {
    String apiServer = dotenv.get("API_SERVER");
    Map<String, String> queryParams = {
      'page': page.toString(),
      'limit': limit.toString(),
    };
    if (title != '') queryParams['title'] = title;
    if (detail != '') queryParams['detail'] = detail;
    if (invitedSubject != '') {
      queryParams['invitedSubject'] =
          getDepartmentFromString(invitedSubject).searchName;
    }
    if (hospitalName != '') queryParams['hospitalName'] = hospitalName;
    if (hospitalLocation != '') {
      queryParams['hospitalLocation'] = hospitalLocation;
    }
    if (keyword != '') {
      queryParams['keywords'] = keyword;
    }

    final url = Uri.parse('$apiServer/career/list/app')
        .replace(queryParameters: queryParams);

    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {'statusCode': response.statusCode, 'data': []};
    }
  }

  static Future<Map<String, dynamic>> getCareer(int no) async {
    String apiServer = dotenv.get("API_SERVER");

    final url = Uri.parse('$apiServer/career?no=$no');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {'statusCode': response.statusCode, 'data': {}};
    }
  }

  static Future<Map<String, dynamic>> careerLike(int careerNo) async {
    String apiServer = dotenv.get("API_SERVER");
    final url = Uri.parse('$apiServer/likeCareer');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');
    final headers = {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json'
    };
    final body = jsonEncode({'careerNo': careerNo});
    final response = await http.post(url, headers: headers, body: body);
    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> careerUnLike(int careerNo) async {
    String apiServer = dotenv.get("API_SERVER");

    final url = Uri.parse('$apiServer/likeCareer');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');
    final headers = {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json'
    };
    final body = jsonEncode({'careerNo': careerNo});
    final response = await http.delete(url, headers: headers, body: body);
    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> getCareerLikeList() async {
    String apiServer = dotenv.get("API_SERVER");
    final url = Uri.parse('$apiServer/likeCareer');
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

  static Future<Map<String, dynamic>> getCareerLikeListInfinite() async {
    String apiServer = dotenv.get("API_SERVER");
    final url = Uri.parse('$apiServer/likeCareer/app');
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
