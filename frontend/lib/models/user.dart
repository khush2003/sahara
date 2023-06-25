import 'dart:convert';

class UserSahara {
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
    required this.userName,
    this.userAddress,
    this.discountCoupon,
  });

  @override
  String toString() {
    return jsonEncode(toJson());
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

  factory UserSahara.fromjson(Map<String, dynamic> json) {
    return UserSahara(
      token: json['Token'] ?? '',
      userName: json['Username'],
      userPhoneNumber: json['UserPhoneNumber'],
      profilePicture: json['ProfilePicture'],
      coverPicture: json['coverPicture'],
      userAddress: json['UserAddress'],
      blockedUser: List<String>.from(json['BlockedUser'] ?? []),
      discountCoupon: List<String>.from(json['DiscountCoupon'] ?? []),
      userOwnPost: List<String>.from(json['UserOwnPost'] ?? []),
      userReviewPost: List<String>.from(json['UserReviewPost'] ?? []),
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
      'userOwnPost': userOwnPost,
      'userReviewPost': userReviewPost,
      'token': token,
    };
  }
}
