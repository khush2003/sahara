import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

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

  factory Message.fromjson(Map<String, dynamic> json, String messageId) {
    return Message(
      messageId: messageId,
      senderId: json['senderId'] ?? '',
      chatRoomId: json['chatRoomId'] ?? '',
      message: json['message'] ?? '',
      timeStamp: (json['timeStamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'chatRoomId': chatRoomId,
      'message': message,
      'timeStamp':
          timeStamp == null ? Timestamp.now() : Timestamp.fromDate(timeStamp!),
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
