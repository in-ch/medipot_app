import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AlarmService {
  static Future<Map<String, dynamic>> getAlarms() async {
    String apiServer = dotenv.get("API_SERVER");
    final url = Uri.parse('$apiServer/alarm');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');
    final headers = {'Authorization': 'Bearer $accessToken'};

    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to getAlarms fetch list');
    }
  }

  static Future<bool> isUnReadAlarm() async {
    try {
      String apiServer = dotenv.get("API_SERVER");
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? accessToken = prefs.getString('accessToken');
      final headers = {'Authorization': 'Bearer $accessToken'};
      final url = Uri.parse('$apiServer/alarm/unread');
      final response = await http.get(url, headers: headers);
      final responseData = jsonDecode(response.body);
      if (responseData['statusCode'] == 200) {
        return responseData['data'] ?? false;
      } else {
        return false;
      }
    } catch (error) {
      debugPrint("Error in isUnReadAlarm: $error");
      return false;
    }
  }

  static Future<bool> setAlarmAllRead() async {
    try {
      String apiServer = dotenv.get("API_SERVER");
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? accessToken = prefs.getString('accessToken');
      final headers = {'Authorization': 'Bearer $accessToken'};
      final url = Uri.parse('$apiServer/alarm/read');
      final response = await http.put(url, headers: headers);
      final responseData = jsonDecode(response.body);
      if (responseData['statusCode'] == 200) {
        return responseData['data'] ?? false;
      } else {
        return false;
      }
    } catch (error) {
      debugPrint("Error in isUnReadAlarm: $error");
      return false;
    }
  }
}
