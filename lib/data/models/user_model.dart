class User {
  final int no;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String email;
  final String nickname;
  final String profile;
  final String department;

  User({
    required this.no,
    required this.createdAt,
    required this.updatedAt,
    required this.email,
    required this.nickname,
    required this.profile,
    required this.department,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      no: json['no'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      email: json['email'],
      nickname: json['nickname'],
      profile: json['profile'],
      department: json['department'],
    );
  }
}

class MeUser {
  final int no;
  final String nickname;
  final String profile;
  final String phone;

  MeUser({
    required this.no,
    required this.nickname,
    required this.profile,
    required this.phone,
  });

  factory MeUser.fromJson(Map<String, dynamic> json) {
    return MeUser(
      no: json['no'],
      nickname: json['nickname'],
      profile: json['profile'],
      phone: json['phone'] ?? '',
    );
  }
}
