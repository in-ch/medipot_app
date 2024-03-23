class LoginUserData {
  final int no;
  final String email;
  final String nickname;
  final String phone;
  final String profile;
  final String token;
  final String refreshToken;
  final DateTime? deletedAt;
  final DateTime updatedAt;

  LoginUserData({
    required this.no,
    required this.email,
    required this.nickname,
    required this.phone,
    required this.profile,
    required this.token,
    required this.refreshToken,
    this.deletedAt,
    required this.updatedAt,
  });

  factory LoginUserData.fromJson(Map<String, dynamic> json) {
    return LoginUserData(
      no: json['no'],
      email: json['email'],
      nickname: json['nickname'],
      phone: json['phone'] ?? '',
      profile: json['profile'],
      token: json['token'],
      refreshToken: json['refresh_token'],
      deletedAt:
          json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
