import 'dart:convert';

class UserSahara {
  final String? uid;
  final String userName;
  late final String? userPhoneNumber;
  final String? profilePicture;
  final String? coverPicture;
  final String? userAddress;
  final List<String>? blockedUser;
  final List<String>? discountCoupon;
  final List<String>? userOwnPost;
  final List<String>? userReviewPost;
  final String? token;

  UserSahara({
    this.token,
    this.profilePicture,
    this.coverPicture,
    this.blockedUser,
    this.userOwnPost,
    this.userReviewPost,
    this.userPhoneNumber,
    this.uid,
    required this.userName,
    this.userAddress,
    this.discountCoupon,
  });

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  factory UserSahara.empty() {
    return UserSahara(uid: '',userName: '');
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
      uid: userId,
      token: json['token'] ?? '',
      userName: json['userName'],
      userPhoneNumber: json['userPhoneNumber'],
      profilePicture: json['profilePicture'],
      coverPicture: json['coverPicture'],
      userAddress: json['userAddress'],
      blockedUser: List<String>.from(json['blockedUser'] ?? []),
      discountCoupon: List<String>.from(json['discountCoupon'] ?? []),
      userOwnPost: List<String>.from(json['userOwnPost'] ?? []),
      userReviewPost: List<String>.from(json['userReviewPost'] ?? []),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'userName': userName,
      'userPhoneNumber': userPhoneNumber,
      'profilePicture': profilePicture,
      'coverPicture': coverPicture,
      'userAddress': userAddress,
      'blockedUser': blockedUser,
      'discountCoupon': discountCoupon,
      'userOwnPost': userOwnPost,
      'userReviewPost': userReviewPost,
      'token': token,
    };
  }
}
