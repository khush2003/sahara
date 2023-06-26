import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sahara/models/donation_item.dart';
import 'package:sahara/models/review.dart';
import 'package:sahara/rest_api.dart';

import '../models/user.dart';
import '../utils/app_utils.dart';

class CreateReviewController extends GetxController {
  final dateTime = DateTime.now().obs;
  final sliderValue = 0.obs;
  final TextEditingController reviewContentController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final DonationItem item = DonationItem.test();
  final RestAPI restAPI = RestAPI();
  // final TextEditingController reviewScoreController = SliderController();
  void getSliderValue(int value) {
    sliderValue(value);
  }

  // createReview function below can't be completed yet, since I

  Future<String> getCurrentUsername() async {
    try {
      // Get the current user info
      final UserSahara currentUser = await restAPI.getCurrentUserInfo();

      return currentUser.userName;
    } catch (error) {
      print(error);
      throw Exception('Failed to get current username');
    }
  }

  Future<void>? createReview(
      String name,
      int duration,
      int usability,
      int price,
      String donationId,
      String reviewText,
      String imageUrl,
      String receiverName,
      String donorName,
      int rating) async {
    if (validateInputs()) {
      try {
        // Authenticate user (Create account)

        final review = Review(
          reviewerId: auth.currentUser!.uid,
          donationId: donationId,
          reviewText: reviewText,
          reviewerName: name,
          reviewerImageURL: imageUrl,
          rating: rating,
        );

        await restAPI.postReview(review);

        successSnackBar("Review Created Sucessfully!");
      } on FirebaseAuthException catch (e) {
        return errorSnackBar(e.code);
      }
    } else {
      return errorSnackBar("Please fill all required fields");
    }
  }

  String? validateReviewContent(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter any meaningful review';
    }
    return null;
  }

  String? validateReviewScore(int? value) {
    if (value == 0) {
      return 'Please give any score';
    }
    return null;
  }

  bool validateInputs() {
    String? reviewError = validateReviewContent(reviewContentController.text);
    // String? reviewScoreError = validateReviewScore(reviewScoreController.value);
    if (reviewError != null) {
      return false;
    }
    return true;
  }

  // void createReview() async{
  //   if(validateInputs()){
  //     try{
  //       final review = Review(
  //         reviewId: reviewId,
  //         reviewerId: reviewerId,
  //         donationId: donationId,
  //         reviewText: reviewText,
  //         name: name,
  //         imageUrl: imageUrl,
  //         donationItemId: donationItemId)
  //     }
  //   }
  // }
}
