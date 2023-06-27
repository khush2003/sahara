import 'package:get/get.dart';
import 'package:sahara/models/donation_item.dart';

import 'donation_item_controller.dart';

class DonationDetailsController extends GetxController {
  late DonationItem donationItem;
  final DonationItemController donationItemController =
      DonationItemController.instance;

  @override
  void onInit() {
    try {
      print(donationItemController.donationItems);
      print(Get.parameters['id']);
      var donationId = Get.parameters['id'];
      donationItem = DonationItem.getFromId(
          donationId!, donationItemController.donationItems);
    } catch (e) {
      throw (e); //TODO: Handle Error
    }
    super.onInit();
  }
}
