import 'dart:convert';

/// [Method]
/// jwt를 디코딩합니다.
Map<String, dynamic> decodeJwt(String token) {
  final parts = token.split('.');
  if (parts.length != 3) {
    throw Exception('Invalid token');
  }

  final payload = parts[1];
  final decoded = utf8.decode(base64Url.decode(base64Url.normalize(payload)));

  return json.decode(decoded);
}
