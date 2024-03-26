// ignore_for_file: file_names
import 'package:docspot_app/data/models/models.dart';

class ReplyDetail {
  final int no;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String comment;
  final User user;
  final int totalCount;

  ReplyDetail({
    required this.no,
    required this.createdAt,
    required this.updatedAt,
    required this.comment,
    required this.user,
    required this.totalCount,
  });

  factory ReplyDetail.fromJson(Map<String, dynamic> json) {
    return ReplyDetail(
      no: json['no'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      comment: json['comment'],
      user: User.fromJson(json['user']),
      totalCount: json['totalCount'],
    );
  }
}
