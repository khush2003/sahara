import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sahara/models/user.dart';
import 'package:sahara/rest_api.dart';
import '../models/donation_item.dart';
import '../models/review.dart';
import '../views/profile_view.dart';
import 'auth/auth_controller.dart';

class CustomTabController extends GetxController {
  static CustomTabController get instance => Get.find<CustomTabController>();
  RxList<UserSahara> blockedUsers = <UserSahara>[].obs;
  final connect = Get.find<GetConnect>();
  final restApi = RestAPI.instance;
  final imageUrl = ''.obs;
  final isGiveSelected = true.obs;
  final isReceiveSelected = false.obs;
  final isNewSelected = true.obs;
  final isHistorySelected = false.obs;
  final _firebaseStorage = FirebaseStorage.instance;
  final _imagePicker = ImagePicker();

  Rx<UserSahara?> user = Rx<UserSahara?>(null);
  Rx<UserSahara?> fuser = Rx<UserSahara?>(null);
  final RxList<DonationItem> donationItems = <DonationItem>[].obs;
  final RxList<Review> reviewList = <Review>[].obs;
  final RxList<Review> userReviewList = <Review>[].obs;

  @override
  void onInit() {
    super.onInit();
    getUserById();
    getBlockedUsersDetails();
    setupLists();
  }

  void getUserById() async {
    UserSahara? fetchedUser =
        await restApi.getUserById(FirebaseAuth.instance.currentUser!.uid);
    if (fetchedUser != null) {
      user.value = fetchedUser;
      getBlockedUsersDetails();
      print("This is from getUserById ${user.value!.blockedUser}");
    } else {
      print("User not found");
    }
  }

  uploadImage(BuildContext context) async {
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var file = File(image.path);
      var snapshot = await _firebaseStorage
          .ref()
          .child('images/${image.name}')
          .putFile(file);
      var downloadUrl = await snapshot.ref.getDownloadURL();
      imageUrl(downloadUrl);
      print(downloadUrl);
      showDialog(
        context: context,
        builder: (context) => ChangeProfileAndCoverPhotoDialog(
          photo: downloadUrl,
          type: 'Profile',
        ),
      );
    }
  }

  void selectNew() {
    isNewSelected(true);
    isHistorySelected(false);
  }

  void selectHistory() {
    isHistorySelected(true);
    isNewSelected(false);
  }

  void selectGive() {
    isGiveSelected(true);
    isReceiveSelected(false);
  }

  void selectReceive() {
    isGiveSelected(false);
    isReceiveSelected(true);
  }

  void getBlockedUsersDetails() async {
    List<String> blockedUserIds = user.value!.blockedUser ?? [];
    print(blockedUserIds);
    //blockedUsers.clear();

    for (String userId in blockedUserIds) {
      UserSahara? fetchedUser = await restApi.getUserById(userId);
      if (fetchedUser != null) {
        //blockedUsers.add(fetchedUser);
        fuser.value = fetchedUser;
        print(fetchedUser);
      }
    }
  }

  Future<void> setupLists() async {
    final List<DonationItem>? donationResult = await restApi.getDonationItems();
    if (donationResult == null) {
      log("No donation items found");
    } else {
      final filteredDonationItems = donationResult
          .where((item) =>
              item.author.authorId == FirebaseAuth.instance.currentUser!.uid)
          .toList();
      donationItems(filteredDonationItems);
    }

    final List<Review>? reviews = await restApi.getReviews();
    if (reviews == null) {
      log("No donation items found");
    } else {
      final filteredReviews = reviews
          .where((review) =>
              donationItems.any((item) => item.donationId == review.donationId))
          .toList();
      final filteredUserReviews = reviews
          .where((review) =>
              review.reviewerId == FirebaseAuth.instance.currentUser!.uid)
          .toList();
      reviewList(filteredReviews);
      userReviewList(filteredUserReviews);
      print(reviewList[0].reviewerId);
    }
  }
}
