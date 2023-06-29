import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sahara/controllers/counpon_controller.dart';
import 'package:sahara/controllers/delivery_status_controller.dart';
import 'package:sahara/controllers/donation_item_controller.dart';
import 'package:sahara/models/donation_item.dart';
import 'package:sahara/models/review.dart';
import 'package:sahara/rest_api.dart';
import '../utils/app_utils.dart';

class CreateReviewController extends GetxController {
  final dateTime = DateTime.now().obs;
  final sliderValue = 0.0.obs;
  final TextEditingController reviewContentController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final RestAPI restAPI = RestAPI.instance;
  final item = DonationItem.test().obs;
  final _itemController = DonationItemController.instance;
  final couponController = Get.put(CouponController());
  final deliveryStatusController = Get.find<DeliveryStatusController>();

  @override
  void onInit() {
    final itemId = Get.parameters['id'] ?? '';
    item(DonationItem.getFromId(itemId, _itemController.donationItems));
    super.onInit();
  }

  Future<void>? createReview(Review review) async {
    if (validateInputs()) {
      try {
        await restAPI.postReview(review);
        couponController.updateCoupon();
        Get.back();
        _itemController.setupLists();
        deliveryStatusController.setupLists();
        successSnackBar("Review Created Sucessfully!");
      } on FirebaseAuthException catch (e) {
        return errorSnackBar(e.code);
      }
    } else {
      return errorSnackBar("Please fill all required fields");
    }
  }

  void updateSliderValue(double value) {
    sliderValue(value);
  }

  String? validateReviewContent(String? value) {
    if (value == null || value.isEmpty || value.length < 20) {
      return 'Please enter a meaningful review';
    }
    return null;
  }

  String? validateReviewScore(int? value) {
    if (value == 0) {
      return 'Please give some score';
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
}
