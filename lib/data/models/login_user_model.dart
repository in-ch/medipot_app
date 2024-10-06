class LoginUserData {
  final int no;
  final String email;
  final String nickname;
  final String phone;
  final String token;
  final String refreshToken;
  final DateTime? deletedAt;
  final String grant;

  LoginUserData({
    required this.no,
    required this.email,
    required this.nickname,
    required this.phone,
    required this.token,
    required this.refreshToken,
    required this.grant,
    this.deletedAt,
  });

  factory LoginUserData.fromJson(Map<String, dynamic> json) {
    return LoginUserData(
      no: json['no'],
      email: json['email'],
      nickname: json['nickname'],
      phone: json['phone'] ?? '',
      token: json['token'],
      refreshToken: json['refresh_token'],
      grant: json['grant'],
      deletedAt:
          json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
    );
  }
}
