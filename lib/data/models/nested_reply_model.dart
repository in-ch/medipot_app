import 'package:medipot_app/data/models/models.dart';

class NestedReply {
  final int no;
  final String comment;
  final User user;

  NestedReply({
    required this.no,
    required this.user,
    required this.comment,
  });

  factory NestedReply.fromJson(Map<String, dynamic> json) {
    return NestedReply(
      no: json['no'],
      comment: json['comment'],
      user: User.fromJson(json['user']),
    );
  }
}
