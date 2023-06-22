class AppUser {
  final String? uid;
  final String username;
  final String userPhoneNumber;
  final String? profilePicture;
  final String? userAddress;
  final List<String>? blockedUser;
  final List<String>? discountCoupon;
  final List<String>? userOwnPost;
  final List<String>? userReviewPost;
  final String? token;

  AppUser({
    this.token,
    this.uid,
    this.profilePicture,
    this.blockedUser,
    this.userOwnPost,
    this.userReviewPost,
    required this.userPhoneNumber,
    required this.username,
    this.userAddress, this.discountCoupon,  
  });
  @override
  String toString() {
    return 'AppUser{uid: $uid, '
        
        '}';
  }

  factory AppUser.empty() {
    return AppUser(username: '', userPhoneNumber: '');
  }

  String getName() {
    return username;
  }



  factory AppUser.fromMap(Map<String, dynamic> map, String userId) {
    return AppUser(
      token: map['Token'] ?? '',
      uid: userId,
      username: map['Username'],
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

bool checkUserInList(String userId, List<AppUser> list) {
  return list.any((user) => user.uid == userId);
}

AppUser? getUserInList(String userId, List<AppUser> list) {
  try {
    return list.where((user) => user.uid == userId).first;
  } catch (e) {
    return null;
  }
}