class ChatMessage {
  final String senderId;
  final String senderFirstName; // Add this line
  final String receiverId;
  final String receiverFirstName; // Add this line
  final String text;
  final DateTime timestamp;

  ChatMessage({
    required this.senderId,
    required this.senderFirstName,
    required this.receiverId,
    required this.receiverFirstName,
    required this.text,
    required this.timestamp,
  });
}
