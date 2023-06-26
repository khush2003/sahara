import 'dart:developer';

import 'package:get/get.dart';
import 'package:sahara/models/donation_item.dart';
import 'package:sahara/models/review.dart';
import 'package:sahara/rest_api.dart';

class DonationItemController extends GetxController {
  final restApi = RestAPI.instance;
  static DonationItemController get instance =>
      Get.find<DonationItemController>();
  final RxList<DonationItem> donationItems = <DonationItem>[].obs;
  final RxList<Review> reviewList = <Review>[].obs;

  @override
  void onInit() async {
    await setupLists();
    super.onInit();
  }

  Future<void> setupLists() async {
     final List<DonationItem>? donationResult = await restApi.getDonationItems();
      if (donationResult == null) {
        log("No donation items found");
      } else {
        donationItems(donationResult);
      }

    final List<Review>? reviews = await restApi.getReviews();
      if (reviews == null) {
        log("No donation items found");
      } else {
        reviewList(reviews);
      }
  }
}
