class Reply {
  final int no;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String comment;

  Reply({
    required this.no,
    required this.createdAt,
    required this.updatedAt,
    required this.comment,
  });

  factory Reply.fromJson(Map<String, dynamic> json) {
    return Reply(
      no: json['no'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      comment: json['comment'],
    );
  }
}
