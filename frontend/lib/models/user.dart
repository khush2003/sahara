import 'dart:convert';

class UserSahara {
  final String? uid;
  final String userName;
  late final String? userPhoneNumber;
  final String? profilePicture;
  final String? coverPicture;
  final String? userAddress;
  final List<String>? blockedUser, chatWithUsers;
  final List<String>? discountCoupon;
  final String? token;

  UserSahara({
    this.token,
    this.profilePicture,
    this.coverPicture,
    this.blockedUser,
    this.userPhoneNumber,
    this.uid,
    required this.userName,
    this.userAddress,
    this.discountCoupon,
    this.chatWithUsers,
  });

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  factory UserSahara.empty() {
    return UserSahara(uid: '', userName: '');
  }

  String getName() {
    return userName;
  }

  factory UserSahara.test() {
    return UserSahara(
      userName: 'James',
      userPhoneNumber: '0123456789',
      profilePicture: 'https://i.imgur.com/BoN9kdC.png',
      userAddress: '123, Jalan ABC, 12345, Selangor',
    );
  }

  factory UserSahara.fromjson(Map<String, dynamic> json, String userId) {
    return UserSahara(
      uid: userId,
      token: json['token'] ?? '',
      userName: json['userName'] ?? '',
      userPhoneNumber: json['userPhoneNumber'] ?? '',
      profilePicture: json['profilePicture'] ?? '',
      coverPicture: json['coverPicture'] ?? '',
      userAddress: json['userAddress'] ?? '',
      blockedUser: List<String>.from(json['blockedUser'] ?? []),
      discountCoupon: List<String>.from(json['discountCoupon'] ?? []),
      chatWithUsers: List<String>.from(json['chatWithUsers'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'userPhoneNumber': userPhoneNumber,
      'profilePicture': profilePicture,
      'coverPicture': coverPicture,
      'userAddress': userAddress,
      'blockedUser': blockedUser,
      'discountCoupon': discountCoupon,
      'token': token,
      'chatWithUsers': chatWithUsers,
    };
  }

  bool checkUserInList(String userId, List<UserSahara> list) {
    return list.any((user) => user.uid == userId);
  }

  UserSahara? getUserInList(String userId, List<UserSahara> list) {
    try {
      return list.where((user) => user.uid == userId).first;
    } catch (e) {
      return null;
    }
  }

  static UserSahara? getUserFromId(
      String? userId, List<UserSahara> list) {
    if (userId == null) {
      return null;
    }
    try {
      return list.where((user) => user.uid == userId).first;
    } catch (e) {
      return null;
    }
  }
}
