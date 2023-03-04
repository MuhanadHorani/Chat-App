class Message {
  final String message;
  final String userId;
  Message(this.message, this.userId);
  factory Message.fromJson(jsonData) {
    return Message(jsonData['message'], jsonData['userId']);
  }
}
