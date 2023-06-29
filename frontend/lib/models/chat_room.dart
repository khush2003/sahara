class ChatRoom {
  final String? chatRoomId;
  final String authorId, userId, donationId;
  const ChatRoom({
    this.chatRoomId,
    required this.authorId,
    required this.userId,
    required this.donationId,
  });

  factory ChatRoom.empty() {
    return const ChatRoom(
      authorId: '',
      userId: '',
      donationId: '',
    );
  }

  factory ChatRoom.fromjson(Map<String, dynamic> json, String chatRoomId) {
    return ChatRoom(
      chatRoomId: chatRoomId,
      authorId: json['authorId'] ?? '',
      userId: json['userId'] ?? '',
      donationId: json['donationId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'authorId': authorId,
      'userId': userId,
      'donationId': donationId,
    };
  }

}