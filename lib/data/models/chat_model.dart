enum MessageType { text, image, video, system, join, leave }

class ChatMessage {
  final String author;
  final String body;
  final String? img;
  final DateTime timestamp;
  final String? profile;
  final int userNo;
  final String uuid;
  final String type;

  ChatMessage({
    required this.author,
    required this.body,
    this.img,
    required this.timestamp,
    this.profile,
    required this.userNo,
    String? uuid,
    required this.type,
  }) : uuid = uuid ?? "";

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'body': body,
      'img': img,
      'timestamp': timestamp.toIso8601String(),
      'profile': profile,
      'userNo': userNo,
      'uuid': uuid,
      'type': type,
    };
  }

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
        author: json['author'] ?? "",
        body: json['body'] ?? "",
        img: json['img'] ?? "",
        timestamp: DateTime.parse(json['timestamp']),
        profile: json['profile'] ?? "",
        userNo: json['userNo'],
        uuid: json.containsKey('uuid') ? json['uuid'] : "",
        type: json['type'] ?? "text");
  }
}
