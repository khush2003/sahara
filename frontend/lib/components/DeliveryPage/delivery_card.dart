import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/components/Feed/donation_details_section.dart';
import 'package:sahara/controllers/delivery_status_controller.dart';
import 'package:sahara/utils/app_utils.dart';

import '../../models/donation_item.dart';
import '../../models/user.dart';
import '../../routes/routes.dart';
import '../../theme/app_theme.dart';

class InTransitCard extends StatelessWidget {
  final DonationItem item;
  final UserSahara user;

  const InTransitCard({
    super.key,
    required this.user,
    required this.item,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            )
          ],
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Row
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: DonationDetailSection(
                    item: item,
                    showDescription: false,
                    showTags: false,
                    showOverPricedWarning: false)),
            // Black line seperating top inf and bottom info
            Container(
              height: 0.5,
              decoration: const BoxDecoration(color: Colors.black),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: DeliveryInformation(
                    arrDate: item.expectedArrivalDate ?? DateTime(2023, 9, 1),
                    item: item,
                    user: user))
          ],
        ),
      ),
    );
  }
}

class CardRowDesc extends StatelessWidget {
  final String? label, input;

  const CardRowDesc({super.key, required this.label, required this.input});

  @override
  Widget build(BuildContext context) {
    if (input != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$label: ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(child: Text(input!))
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}

class ToDeliverCard extends StatelessWidget {
  final DonationItem item;
  final UserSahara user;

  const ToDeliverCard({
    super.key,
    required this.user,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            )
          ],
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Row
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: DonationDetailSection(
                    item: item,
                    showDescription: false,
                    showTags: false,
                    showOverPricedWarning: false)),
            // Black line seperating top inf and bottom info
            Container(
              height: 0.5,
              decoration: const BoxDecoration(color: Colors.black),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: DeliveryInformationPickUp(
                    item: item,
                    user: user,
                    arrDate: item.pickUpDate ?? DateTime(2023, 8, 1)))
          ],
        ),
      ),
    );
  }
}

class ToReceiveCard extends StatelessWidget {
  final DonationItem item;
  final UserSahara user;

  const ToReceiveCard({
    super.key,
    required this.item,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            )
          ],
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Row
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: DonationDetailSection(
                    item: item,
                    showDescription: false,
                    showTags: false,
                    showOverPricedWarning: false)),
            // Black line seperating top inf and bottom info
            Container(
              height: 0.5,
              decoration: const BoxDecoration(color: Colors.black),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: DeliveryInformation(
                    item: item,
                    user: user,
                    arrDate: item.expectedArrivalDate ?? DateTime(2023, 9, 1)))
          ],
        ),
      ),
    );
  }
}

class DeliveredCard extends StatelessWidget {
  final controller = Get.find<DeliveryStatusController>();
  final DonationItem item;
  final UserSahara user;

  DeliveredCard({
    super.key,
    required this.user,
    required this.item,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            )
          ],
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Row
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: DonationDetailSection(
                    item: item,
                    showDescription: false,
                    showTags: false,
                    showOverPricedWarning: false)),
            // Black line seperating top inf and bottom info
            Container(
              height: 0.5,
              decoration: const BoxDecoration(color: Colors.black),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: DeliveryInformationDelivered(
                    arrDate: item.expectedArrivalDate ?? DateTime(2023, 9, 1),
                    item: item,
                    user: user)),
            Container(
              height: 0.5,
              decoration: const BoxDecoration(color: Colors.black),
            ),
            Obx(() => controller.isPostReviewable(item)
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primary),
                          onPressed: () =>
                              Get.toNamed(Routes.review, parameters: {
                                'id': item.donationId!,
                              }),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Text(
                              'Review',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          )),
                    ),
                  )
                : Container())
          ],
        ),
      ),
    );
  }
}

class DeliveryInformation extends StatelessWidget {
  final DonationItem item;
  final UserSahara user;
  final DateTime arrDate;
  const DeliveryInformation(
      {super.key,
      required this.item,
      required this.user,
      required this.arrDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Delivery Information',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        CardRowDesc(label: 'Name', input: user.userName),
        CardRowDesc(label: 'Phone', input: user.userPhoneNumber),
        CardRowDesc(label: 'Delivery Fee', input: "${item.deliveryFees} bhat"),
        CardRowDesc(label: 'Address', input: user.userAddress),
        CardRowDesc(label: 'Expected Arrival Date', input: formatDate(arrDate))
      ],
    );
  }
}

class DeliveryInformationPickUp extends StatelessWidget {
  final DonationItem item;
  final UserSahara user;
  final DateTime arrDate;
  const DeliveryInformationPickUp(
      {super.key,
      required this.item,
      required this.user,
      required this.arrDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Delivery Information',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        CardRowDesc(label: 'Name', input: user.userName),
        CardRowDesc(label: 'Phone', input: user.userPhoneNumber),
        CardRowDesc(label: 'Delivery Fee', input: "${item.deliveryFees} bhat"),
        CardRowDesc(label: 'Address', input: user.userAddress),
        CardRowDesc(label: 'Pick Up Date', input: formatDate(arrDate))
      ],
    );
  }
}

class DeliveryInformationDelivered extends StatelessWidget {
  final DonationItem item;
  final UserSahara user;
  final DateTime arrDate;
  const DeliveryInformationDelivered(
      {super.key,
      required this.item,
      required this.user,
      required this.arrDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Delivery Information',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        CardRowDesc(label: 'Name', input: user.userName),
        CardRowDesc(label: 'Phone', input: user.userPhoneNumber),
        CardRowDesc(label: 'Delivery Fee', input: "${item.deliveryFees} bhat"),
        CardRowDesc(label: 'Address', input: user.userAddress),
        CardRowDesc(label: 'Expected Arrival Date', input: formatDate(arrDate)),
      ],
    );
  }
}
