import 'dart:developer';

import 'package:get/get.dart';
import 'package:sahara/models/donation_item.dart';
import 'package:sahara/rest_api.dart';
import 'package:sahara/views/profile_view.dart';

class DonationItemController extends GetxController {
  final restApi = RestAPI.instance;
  static DonationItemController get instance => Get.find<DonationItemController>();
  final RxList<DonationItem> donationItems = <DonationItem>[].obs;
  @override
  void onInit() async {
    final List<DonationItem>? result = await restApi.getDonationItems();
    if (result == null) {
      log("No donation items found");
    } else {
      donationItems(result);
    }
    print(result);
    super.onInit();
  }
}
