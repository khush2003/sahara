import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/components/Feed/upload_address_popup.dart';
import 'package:sahara/controllers/auth/auth_controller.dart';
import 'package:sahara/controllers/chat/chat_room_controller.dart';
import 'package:sahara/models/donation_item.dart';
import 'package:sahara/models/review.dart';
import 'package:sahara/rest_api.dart';
import 'package:sahara/routes/routes.dart';

class DonationItemController extends GetxController {
  final restApi = RestAPI.instance;
  static DonationItemController get instance =>
      Get.find<DonationItemController>();
  final RxList<DonationItem> donationItems = <DonationItem>[].obs;
  final RxList<Review> reviewList = <Review>[].obs;
  final RxList<DonationItem> filteredList = <DonationItem>[].obs;
  final RxList<DonationItem> filteredItemsStored = <DonationItem>[].obs;
  final RxInt selectedCategoryIndex = 0.obs;
  final searchController = TextEditingController();
  final _auth = AuthController.instance;
  @override
  void onInit() async {
    await setupLists();
    super.onInit();
  }

  void routeToCreateDonation() {
    final user = _auth.userSahara.value;
    if (user.userAddress == null ||
        user.userAddress!.isEmpty ||
        user.userPhoneNumber == null ||
        user.userPhoneNumber!.isEmpty) {
      showUploadAddressDialog();
    } else {
      Get.toNamed(Routes.createDonation);
    }
  }



  Future<void> setupLists() async {
    final List<DonationItem>? donationResult = await restApi.getDonationItems();
    if (donationResult == null) {
    } else {
      donationItems(donationResult);
      filteredList(donationResult);
      filteredItemsStored(donationResult);
    }

    final List<Review>? reviews = await restApi.getReviews();
    if (reviews == null) {
    } else {
      reviewList(reviews);
    }
  }

  void filterDonationItems(String category) {
    if (category == 'All') {
      filteredList(donationItems.toList());
      filteredItemsStored(donationItems.toList());
    } else {
      final lowercaseCategory = category.toLowerCase();
      final filteredItems = donationItems.where((item) {
        final lowercaseEventCategory = item.category.toLowerCase();
        return lowercaseEventCategory == lowercaseCategory;
      }).toList();
      filteredList(filteredItems);
      filteredItemsStored(filteredItems);
    }
  }

  void searchEvents() {
    if (searchController.text.isEmpty) {
      filteredList(filteredItemsStored.toList());
    }

    final lowercaseSearchString = searchController.text.toLowerCase();

    final filteredSearched = filteredList.where((item) {
      final lowercaseTitle = item.name.toLowerCase();
      final lowercaseDescription = item.description.toLowerCase();
      final lowercaseCategory = item.category.toLowerCase();
      final lowercaseEventOwner = item.author.name.toLowerCase();
      final lowercaseTags = item.tags.map((tag) => tag.toLowerCase()).toList();
      if (lowercaseTitle.contains(lowercaseSearchString) ||
          lowercaseDescription.contains(lowercaseSearchString) ||
          lowercaseCategory.contains(lowercaseSearchString) ||
          lowercaseEventOwner.contains(lowercaseSearchString)) {
        return true;
      }

      for (final tag in lowercaseTags) {
        if (tag.contains(lowercaseSearchString)) {
          return true;
        }
      }

      return false;
    }).toList();

    filteredList(filteredSearched);
  }

  void clearEvents() {
    filteredList(filteredItemsStored.toList());
    searchController.text = '';
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
