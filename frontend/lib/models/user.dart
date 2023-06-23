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
    return 'AppUser{uid: $uid, '
        '}';
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

  factory UserSahara.fromMap(Map<String, dynamic> map, String userId) {
    return UserSahara(
      token: map['Token'] ?? '',
      uid: userId,
      userName: map['Username'],
      userPhoneNumber: map['UserPhoneNumber'],
      profilePicture: map['ProfilePicture'],
      userAddress: map['UserAddress'],
      blockedUser: List<String>.from(map['BlockedUser'] ?? []),
      discountCoupon: List<String>.from(map['DiscountCoupon'] ?? []),
      userOwnPost: List<String>.from(map['YserOwnPost'] ?? []),
      userReviewPost: List<String>.from(map['UserReviewPost'] ?? []),
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
