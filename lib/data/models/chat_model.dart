class ChatMessage {
  final String senderId;
  final String content;
  final String? imagePath;
  final DateTime timestamp;

  ChatMessage({
    required this.senderId,
    required this.content,
    this.imagePath,
    required this.timestamp,
  });
}
