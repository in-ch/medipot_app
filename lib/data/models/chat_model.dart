class ChatMessage {
  final String author;
  final String body;
  final String? img;
  final DateTime timestamp;
  final String? profile;
  final int userNo;
  final String uuid;

  ChatMessage({
    required this.author,
    required this.body,
    this.img,
    required this.timestamp,
    this.profile,
    required this.userNo,
    required this.uuid,
  });

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'body': body,
      'img': img,
      'timestamp': timestamp.toIso8601String(),
      'profile': profile,
      'userNo': userNo,
      'uuid': uuid,
    };
  }

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
        author: json['author'],
        body: json['body'],
        img: json['img'],
        timestamp: DateTime.parse(json['timestamp']),
        profile: json['profile'],
        uuid: json['uuid'],
        userNo: json['userNo']);
  }
}
