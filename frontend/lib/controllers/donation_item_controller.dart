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
  final RxList<DonationItem> filteredList = <DonationItem>[].obs;
  final RxInt selectedCategoryIndex = 0.obs;

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
      filteredList(donationResult);
    }

    final List<Review>? reviews = await restApi.getReviews();
    if (reviews == null) {
      log("No donation items found");
    } else {
      reviewList(reviews);
    }
  }

  void filterDonationItems(String category) {
    if (category == 'All') {
      filteredList(donationItems.toList());
    } else {
      final lowercaseCategory = category.toLowerCase();
      final filteredItems = donationItems.where((item) {
        final lowercaseEventCategory = item.category.toLowerCase();
        return lowercaseEventCategory == lowercaseCategory;
      }).toList();
      filteredList(filteredItems);
    }
  }

  // void searchEvents() {
  //   if (searchController.text.isEmpty) {
  //     filteredEvents(_event.events.toList());
  //   }

  //   final lowercaseSearchString = searchController.text.toLowerCase();

  //   final filterEvents = _event.events.where((event) {
  //     final lowercaseTitle = event.title.toLowerCase();
  //     final lowercaseDescription = event.description.toLowerCase();
  //     final lowercaseCategory = event.category.toLowerCase();
  //     final lowercaseEventOwner = event.eventOwner.name.toLowerCase();
  //     final lowercaseTags =
  //         event.tags?.map((tag) => tag.toLowerCase()).toList() ?? [];

  //     if (lowercaseTitle.contains(lowercaseSearchString) ||
  //         lowercaseDescription.contains(lowercaseSearchString) ||
  //         lowercaseCategory.contains(lowercaseSearchString) ||
  //         lowercaseEventOwner.contains(lowercaseSearchString)) {
  //       return true;
  //     }

  //     for (final tag in lowercaseTags) {
  //       if (tag.contains(lowercaseSearchString)) {
  //         return true;
  //       }
  //     }

  //     return false;
  //   }).toList();

  //   filteredEvents(filterEvents);
  // }
}
