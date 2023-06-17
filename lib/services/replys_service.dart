import 'dart:convert';
import 'package:http/http.dart' as http;

class ReplysService {
  static Future<Map<String, dynamic>> getReplys(
      int writingNo, int page, int limit) async {
    final url = Uri.parse(
        'http://localhost:4000/reply?writingNo=$writingNo&page=$page&limit=$limit');
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InN4aW4yOTQ5QG5hdmVyLmNvbSIsIm5pY2tuYW1lIjoidW5rbm93bl8zY3ozZmwzaG4iLCJwYXNzd29yZCI6IjExIiwicHJvZmlsZSI6Imh0dHA6Ly9rLmtha2FvY2RuLm5ldC9kbi9kcGs5bDEvYnRxbUdoQTJsS0wvT3owd0R1Sm4xWVYyREluOTJmNkRWSy9pbWdfMTEweDExMC5qcGciLCJpc1NvY2lhbExvZ2luIjp0cnVlLCJkZWxldGVkQXQiOm51bGwsInBob25lIjpudWxsLCJubyI6NTcsImNyZWF0ZWRBdCI6IjIwMjMtMDYtMTdUMDM6MzA6NDguOTg5WiIsInVwZGF0ZWRBdCI6IjIwMjMtMDYtMTdUMDM6MzA6NDguOTg5WiIsImdyYW50IjoiTk9ORSIsIm1hcmtldGluZ0NvbnNlbnQiOmZhbHNlLCJkZXBhcnRtZW50Ijoi7KeE66OM6rO8IOyXhuydjCIsInRva2VuIjoiIiwicmVmcmVzaF90b2tlbiI6IiIsImlhdCI6MTY4Njk3MjY0OSwiZXhwIjoxNzk0OTcyNjQ5fQ.z2ZD-F-lUGqdJR9xyIZd-58UzSqRG1e3wmZB64KKhnI'
    };

    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to replys fetch list');
    }
  }
}
