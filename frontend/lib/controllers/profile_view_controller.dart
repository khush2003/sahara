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
import 'package:sahara/controllers/donation_item_controller.dart';

class CustomTabController extends GetxController {
  static CustomTabController get instance => Get.find<CustomTabController>();

  final connect = Get.find<GetConnect>();
  final restApi = RestAPI.instance;
  final imageUrl = ''.obs;
  final isGiveSelected = true.obs;
  final isReceiveSelected = false.obs;
  final isNewSelected = true.obs;
  final isHistorySelected = false.obs;
  final _firebaseStorage = FirebaseStorage.instance;
  final _imagePicker = ImagePicker();
  final DonationItemController donationItem = Get.put(DonationItemController());

  final auth = AuthController.instance;
  //List<UserSahara> blockedUsers = <UserSahara>[].obs;
  final RxList<DonationItem> donationItems = <DonationItem>[].obs;
  final RxList<UserSahara> blockedUsers = <UserSahara>[].obs;
  final RxList<Review> reviewList = <Review>[].obs;
  final RxList<Review> userReviewList = <Review>[].obs;

  @override
  void onInit() {
    super.onInit();
    setupLists();
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
      Get.dialog(ChangeProfileAndCoverPhotoDialog(
        photo: downloadUrl,
        type: 'Profile',
      ));
    }
  }

  unblockUserById(userId) async {
    await restApi.unblockUserById(userId, auth.userSahara.value.blockedUser!);
    setupLists();
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

  Future<void> setupLists() async {
    final List<DonationItem> donationResult = await restApi.getDonationItems();
    // final List<DonationItem> donationResult = donationItem.donationItems;
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
    // final List<Review> reviews = donationItem.reviewList;
    if (reviews == null) {
      log("No review items found");
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
    }

    final List<UserSahara>? allUsers =
        await restApi.getBlockedUsers(auth.userSahara.value.blockedUser!);
    if (allUsers == null) {
      log("No Users found");
    } else {
      blockedUsers(allUsers);
    }
  }
}
