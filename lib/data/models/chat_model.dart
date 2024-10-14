class ChatMessage {
  final String author;
  final String body;
  final String? img;
  final DateTime timestamp;

  ChatMessage({
    required this.author,
    required this.body,
    this.img,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'body': body,
      'img': img,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
