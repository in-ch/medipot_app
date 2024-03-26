import 'package:docspot_app/data/models/models.dart';

class Like {
  final int no;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;

  Like({
    required this.no,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory Like.fromJson(Map<String, dynamic> json) {
    return Like(
      no: json['no'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      user: User.fromJson(json['user']),
    );
  }
}
