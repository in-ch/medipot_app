class ChatMessage {
  final String senderId;
  final String content;
  final DateTime timestamp;

  ChatMessage({
    required this.senderId,
    required this.content,
    required this.timestamp,
  });
}
