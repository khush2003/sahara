import 'dart:convert';


class Message {
  final String? messageId;
  final String chatRoomId, senderId, message;
  final DateTime? timeStamp;

  Message({
    this.messageId,
    required this.senderId,
    required this.chatRoomId,
    required this.message,
    required this.timeStamp,
  });

  factory Message.empty() {
    return Message(
      senderId: '',
      chatRoomId: '',
      message: '',
      timeStamp: DateTime.now(),
    );
  }

  factory Message.fromjson(Map<String, dynamic> json) {
    return Message(
      messageId: json['messageId'],
      senderId: json['senderId'] ?? '',
      chatRoomId: json['chatRoomId'] ?? '',
      message: json['message'] ?? '',
      timeStamp: json['timeStamp'] == null
            ? null
            : DateTime.parse(json['timeStamp'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'chatRoomId': chatRoomId,
      'message': message,
      'timeStamp': DateTime.now().toIso8601String(),
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
