import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class CareerService {
  static Future<Map<String, dynamic>> getCareers(
      int page,
      int limit,
      String title,
      String detail,
      String invitedSubject,
      String hospitalName,
      String hospitalLocation) async {
    String apiServer = dotenv.get("API_SERVER");
    Map<String, String> queryParams = {
      'page': page.toString(),
      'limit': limit.toString(),
    };
    if (title != '') queryParams['title'] = title;
    if (detail != '') queryParams['detail'] = detail;
    if (invitedSubject != '') queryParams['invitedSubject'] = invitedSubject;
    if (hospitalName != '') queryParams['hospitalName'] = hospitalName;
    if (hospitalLocation != '') {
      queryParams['hospitalLocation'] = hospitalLocation;
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
}
