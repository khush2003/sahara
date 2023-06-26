import 'package:get/get.dart';
import 'package:sahara/models/donation_item.dart';

import 'donation_item_controller.dart';

class DonationDetailsController extends GetxController {
  late DonationItem donationItem;
  final DonationItemController donationItemController = DonationItemController.instance;

  @override
  void onInit() {
    try{
        var donationId = Get.parameters['id'];
    donationItem = DonationItem.getFromId(donationId!, donationItemController.donationItems);
    } catch(e){
      print(e); //TODO: Handle Error
    }
    super.onInit();
  }
}
