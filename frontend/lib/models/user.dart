import 'dart:convert';

class UserSahara {
  final String? uid;
  final String userName;
  final String? userPhoneNumber;
  final String? profilePicture;
  final String? userAddress;
  final List<String>? blockedUser;
  final List<String>? discountCoupon;
  final List<String>? userOwnPost;
  final List<String>? userReviewPost;
  final String? token;

  UserSahara({
    this.token,
    this.uid,
    this.profilePicture,
    this.blockedUser,
    this.userOwnPost,
    this.userReviewPost,
    this.userPhoneNumber,
    required this.userName,
    this.userAddress,
    this.discountCoupon,
  });
  @override
  String toString() {
    return 'AppUser{uid: $uid, ''}';
  }

  factory UserSahara.empty() {
    return UserSahara(userName: '');
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

  factory UserSahara.fromjson(Map<String, dynamic> json,String userId) {
    return UserSahara(
      token: json['Token'] ?? '',
      uid: userId,
      userName: json['Username'],
      userPhoneNumber: json['UserPhoneNumber'],
      profilePicture: json['ProfilePicture'],
      userAddress: json['UserAddress'],
      blockedUser: List<String>.from(json['BlockedUser'] ?? []),
      discountCoupon: List<String>.from(json['DiscountCoupon'] ?? []),
      userOwnPost: List<String>.from(json['YserOwnPost'] ?? []),
      userReviewPost: List<String>.from(json['UserReviewPost'] ?? []),
    );
  }
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
