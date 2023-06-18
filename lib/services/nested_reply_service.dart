import 'dart:convert';
import 'package:http/http.dart' as http;

class NestedReplysService {
  static Future<Map<String, dynamic>> getNestedReplys(
      int no, int page, int limit) async {
    final url = Uri.parse(
        'http://localhost:4000/nestedReply/list?page=$page&limit=$limit&replyNo=$no');
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InN4aW4yOTQ5QG5hdmVyLmNvbSIsIm5pY2tuYW1lIjoidW5rbm93bi4zY3czZnIzaG40MiIsInBhc3N3b3JkIjoiMTEiLCJwaG9uZSI6IjAxMDU2OTIyOTQ5IiwicHJvZmlsZSI6Imh0dHBzOi8vc3NsLnBzdGF0aWMubmV0L3N0YXRpYy9wd2UvYWRkcmVzcy9pbWdfcHJvZmlsZS5wbmciLCJpc1NvY2lhbExvZ2luIjp0cnVlLCJkZWxldGVkQXQiOm51bGwsIm5vIjo1NiwiY3JlYXRlZEF0IjoiMjAyMy0wNi0wNFQwODoyNTozNi4zMDdaIiwidXBkYXRlZEF0IjoiMjAyMy0wNi0wNFQwODoyNTozNi4zMDdaIiwiZ3JhbnQiOiJOT05FIiwibWFya2V0aW5nQ29uc2VudCI6ZmFsc2UsImRlcGFydG1lbnQiOiLsp4Tro4zqs7wg7JeG7J2MIiwidG9rZW4iOiIiLCJyZWZyZXNoX3Rva2VuIjoiIiwiaWF0IjoxNjg1ODY3MTM2LCJleHAiOjE3OTM4NjcxMzZ9.an3AW7J8KW6hLihah-aVK9PzIgxkYeFJrRFmzYsdOIo'
    };

    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to nestedReplys fetch list');
    }
  }
}
