import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class UploadService {
  // 파일 업로드 메서드
  Future<String> uploadFile(File file) async {
    try {
      final String apiServer = dotenv.get("API_SERVER");
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$apiServer/uploads'),
      );
      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          file.path,
        ),
      );

      // 요청 보내기
      final streamedResponse = await request.send();
      if (streamedResponse.statusCode == 201) {
        var data = await http.Response.fromStream(streamedResponse);
        // body를 JSON으로 디코드
        var jsonResponse = jsonDecode(data.body);
        String url = jsonResponse['url'];
        return await requestGrant(url);
      } else {
        return "500";
      }
    } catch (e) {
      debugPrint("파일 업로드 중 오류 발생: $e");
      return "500";
    }
  }

  static Future<String> requestGrant(String licenseUrl) async {
    String apiServer = dotenv.get("API_SERVER");
    final Uri url = Uri.parse('$apiServer/user/profile/grant');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');
    final headers = {'Authorization': 'Bearer $accessToken'};
    final body = {"license": licenseUrl};
    final response = await http.put(url, headers: headers, body: body);
    final responseData = await jsonDecode(response.body);
    return responseData["statusCode"];
  }
}
