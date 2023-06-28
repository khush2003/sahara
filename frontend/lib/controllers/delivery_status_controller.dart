import 'package:get/get.dart';
import 'package:sahara/controllers/auth/auth_controller.dart';
import 'package:sahara/controllers/donation_item_controller.dart';
import 'package:sahara/models/donation_item.dart';
import 'package:sahara/utils/app_utils.dart';

class DeliveryStatusController extends GetxController {
  final _itemController = DonationItemController.instance;
  final auth = AuthController.instance;
  final inTransitList = <DonationItem>[].obs;
  final toDeliverList = <DonationItem>[].obs;
  final toReceiveList = <DonationItem>[].obs;
  final deliveredList = <DonationItem>[].obs;

  @override
  void onInit() {
    _itemController.donationItems.listen((donationItemList) {
      // // TESTMODE
      // final donationItems = donationItemList.toList();
      final donationItems = donationItemList
          .where(
              (element) => element.receiverId == auth.userSahara.value.uid)
          .toList();
      inTransitList.clear();
      toDeliverList.clear();
      toReceiveList.clear();
      deliveredList.clear();

      for (var element in donationItems) {
        if (element.deliveryStatus == DeliveryStatus.inTransit) {
          inTransitList.add(element);
        } else if (element.deliveryStatus == DeliveryStatus.toDeliver) {
          toDeliverList.add(element);
        } else if (element.deliveryStatus == DeliveryStatus.toReceive) {
          toReceiveList.add(element);
        } else if (element.deliveryStatus == DeliveryStatus.delivered) {
          deliveredList.add(element);
        } else {
          inTransitList.add(element);
        }
      }
    });
    super.onInit();
  }
}
