import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sahara/models/donation_item.dart';
import 'package:sahara/models/user.dart';
import 'package:sahara/views/profile_view.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<String>?> getCategories() async {
    final document = _firestore.collection('AppData').doc('AppData');
    final snapshot = await document.get();

    if (!snapshot.exists) {
      return null;
    }
    final data = snapshot.data();
    return List<String>.from(data!['Categories'] as List<dynamic>);
  }

  Future<List<String>?> getDuration() async {
    final document = _firestore.collection('AppData').doc('AppData');
    final snapshot = await document.get();

    if (!snapshot.exists) {
      return null;
    }
    final data = snapshot.data();
    return List<String>.from(data!['Duration'] as List<dynamic>);
  }

  Future<List<String>?> getDurationTypes() async {
    final document = _firestore.collection('AppData').doc('AppData');
    final snapshot = await document.get();

    if (!snapshot.exists) {
      return null;
    }
    final data = snapshot.data();
    return List<String>.from(data!['Duration Types'] as List<dynamic>);
  }

  Future<List<String>?> getPaidBy() async {
    final document = _firestore.collection('AppData').doc('AppData');
    final snapshot = await document.get();

    if (!snapshot.exists) {
      return null;
    }
    final data = snapshot.data();
    return List<String>.from(data!['Paid By'] as List<dynamic>);
  }

  Future<void> addItem(DonationItem item /*, UserSahara user*/) async {
    final doc = await _firestore.collection('donationItems').add({
      'donationId': item.donationId,
      'name': item.name,
      'description': item.description,
      'imageUrl': item.imageUrl,
      'category': item.category,
      'itemWidth': item.itemWidth,
      'itemLength': item.itemLength,
      'itemHeight': item.itemHeight,
      'weight': item.weight,
      'deliveryPaidBy': item.deliveryPaidBy,
      'usedDuration': item.usedDuration,
      'usedDurationType': item.usedDurationType,
      'usedDurationTotal': item.usedDurationTotal.inDays,
      'useability': item.useability,
      'price': item.price,
      'deliveryFees': item.deliveryFees,
      'tags': item.tags,
      /*'authorId': user.uid,
        'authorName': user.userName,
        'authorImageUrl': user.profilePicture,*/
    });
  }

  Future<void> addUser(UserSahara user) async {
    await _firestore.collection('users').doc(user.uid).set({
      'uid': user.uid,
      'userName': user.userName,
      'userPhoneNumber': user.userPhoneNumber,
      'profilePicture': user.profilePicture,
      'userAddress': user.userAddress,
      'blockedUser': user.blockedUser ?? [],
      'discountCoupon': user.discountCoupon ?? [],
      'userOwnPost': user.userOwnPost ?? [],
      'userReviewPost': user.userReviewPost ?? [],
      'token': user.token ?? '',
    });
  }

  Future<UserSahara?> getUserById(String userId) async {
    final document = _firestore.collection('users').doc(userId);
    final snapshot = await document.get();

    if (!snapshot.exists) {
      return null;
    }

    final data = snapshot.data() as Map<String, dynamic>;

    return UserSahara(
      uid: data['uid'],
      userName: data['userName'],
      userPhoneNumber: data['userPhoneNumber'],
      profilePicture: data['profilePicture'],
      userAddress: data['userAddress'],
      blockedUser: List<String>.from(data['blockedUser'] ?? []),
      discountCoupon: List<String>.from(data['discountCoupon'] ?? []),
      userOwnPost: List<String>.from(data['userOwnPost'] ?? []),
      userReviewPost: List<String>.from(data['userReviewPost'] ?? []),
      token: data['token'],
    );
  }
}
