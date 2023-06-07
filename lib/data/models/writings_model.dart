import 'package:medipot_app/data/models/models.dart';

class Writing {
  final int no;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String title;
  final String text;
  final List<String> tags;
  final List<String> imgs;
  final User user;
  final List<Like> like;
  final List<Reply> reply;

  Writing({
    required this.no,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.text,
    required this.tags,
    required this.imgs,
    required this.user,
    required this.like,
    required this.reply,
  });

  factory Writing.fromJson(Map<String, dynamic> json) {
    List<dynamic> likeList = json['like'];
    List<dynamic> replyList = json['reply'];

    return Writing(
      no: json['no'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      title: json['title'],
      text: json['text'],
      tags: List<String>.from(json['tags']),
      imgs: List<String>.from(json['imgs']),
      user: User.fromJson(json['user']),
      like: likeList.map((like) => Like.fromJson(like)).toList(),
      reply: replyList.map((reply) => Reply.fromJson(reply)).toList(),
    );
  }
}
