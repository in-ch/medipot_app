import 'dart:convert';
import 'package:http/http.dart' as http;

class ConsultService {
  static Future<Map<String, dynamic>> getMyConsults() async {
    final url = Uri.parse('http://localhost:4000/consult/list');
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJubyI6MSwiZW1haWwiOiJzeGluMjk0OUBuYXZlci5jb20iLCJuaWNrbmFtZSI6InVua25vd24uM2Q3M2c1M2h6IiwicGhvbmUiOiIwMTA1NjkyMjk0OSIsInByb2ZpbGUiOiJodHRwczovL2sua2FrYW9jZG4ubmV0L2RuL2RwazlsMS9idHFtR2hBMmxLTC9PejB3RHVKbjFZVjJESW45MmY2RFZLL2ltZ18xMTB4MTEwLmpwZyIsInRva2VuIjoiIiwicmVmcmVzaF90b2tlbiI6IiIsInBhc3N3b3JkIjoiMTEiLCJpYXQiOjE2OTQ4NTYzOTUsImV4cCI6MTgwMjg1NjM5NX0.NQHiedKEbjGYy2Vxt0czaACWtpXpshPfzrWn0bm2qME'
    };

    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to my consults fetch list');
    }
  }
}
