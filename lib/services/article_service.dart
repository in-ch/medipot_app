import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:docspot_app/app/constants/constants.dart';

class ArticleService {
  static Future<Map<String, dynamic>> getArticles(
    int page,
    int limit,
    String title,
    String content,
    String invitedSubject,
  ) async {
    String apiServer = dotenv.get("API_SERVER");
    Map<String, String> queryParams = {
      'page': page.toString(),
      'limit': limit.toString(),
    };
    if (title != '') queryParams['title'] = title;
    if (content != '') queryParams['content'] = content;
    if (invitedSubject != '') {
      queryParams['invitedSubject'] =
          getDepartmentFromString(invitedSubject).searchName;
    }

    final url = Uri.parse('$apiServer/article/list')
        .replace(queryParameters: queryParams);

    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {'statusCode': response.statusCode, 'data': []};
    }
  }

  static Future<Map<String, dynamic>> getArticle(int no) async {
    String apiServer = dotenv.get("API_SERVER");

    final url = Uri.parse('$apiServer/article?no=$no');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {'statusCode': response.statusCode, 'data': {}};
    }
  }
}
