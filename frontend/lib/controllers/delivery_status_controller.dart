import 'package:get/get.dart';
import 'package:sahara/controllers/auth/auth_controller.dart';
import 'package:sahara/controllers/donation_item_controller.dart';
import 'package:sahara/models/donation_item.dart';
import 'package:sahara/models/review.dart';
import 'package:sahara/rest_api.dart';
import 'package:sahara/utils/app_utils.dart';

class DeliveryStatusController extends GetxController {
  final _itemController = DonationItemController.instance;
  final auth = AuthController.instance;
  final inTransitList = <DonationItem>[].obs;
  final toDeliverList = <DonationItem>[].obs;
  final toReceiveList = <DonationItem>[].obs;
  final deliveredList = <DonationItem>[].obs;
  final _restApi = RestAPI.instance;

  @override
  void onInit() async {
    setupLists();
    super.onInit();
  }

  void setupLists() {
    _itemController.donationItems.listen((donationItemList) async {
      // // TESTMODE
      // final donationItems = donationItemList.toList();
      final donationItems = donationItemList
          .where((element) => element.paymentId != null)
          .toList();
      final completedDonationItems = <DonationItem>[];
      for (DonationItem item in donationItems) {
        final payment = await _restApi.getPaymentById(item.paymentId!);
        switch (payment.deliveryPaidBy) {
          case DeliveryPaidBy.donor:
            if (payment.paymentImageUrlSender != null &&
                payment.paymentImageUrlSender!.isNotEmpty) {
              completedDonationItems.add(item);
            }
            break;
          case DeliveryPaidBy.receiver:
            if (payment.paymentImageUrlReceiver != null &&
                payment.paymentImageUrlReceiver!.isNotEmpty) {
              completedDonationItems.add(item);
            }
            break;
          case DeliveryPaidBy.both:
            if (payment.paymentImageUrlSender != null &&
                payment.paymentImageUrlSender!.isNotEmpty &&
                payment.paymentImageUrlReceiver != null &&
                payment.paymentImageUrlReceiver!.isNotEmpty) {
              completedDonationItems.add(item);
            }
            break;
          default:
            break;
        }
      }
      inTransitList.clear();
      toDeliverList.clear();
      toReceiveList.clear();
      deliveredList.clear();
    
      for (var element in completedDonationItems) {
        if (element.deliveryStatus == DeliveryStatus.inTransit) {
          inTransitList.add(element);
        } else if (element.deliveryStatus == DeliveryStatus.toDeliver) {
          toDeliverList.add(element);
        } else if (element.deliveryStatus == DeliveryStatus.toReceive) {
          toReceiveList.add(element);
        } else if (element.deliveryStatus == DeliveryStatus.delivered) {
          deliveredList.add(element);
        } else {
          toDeliverList.add(element);
        }
      }
    });
  }

  bool isPostReviewable(DonationItem item) {
    for (Review review in _itemController.reviewList) {
      if (review.reviewerId == auth.userSahara.value.uid) {
        return false;
      }
    }
    return true;
  }
}
