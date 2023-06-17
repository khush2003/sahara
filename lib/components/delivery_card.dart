import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/models/donation_post.dart';
import 'package:sahara/models/user.dart';
import 'package:sahara/theme/app_theme.dart';

import '../routes/routes.dart';

class InTransitCard extends StatelessWidget {
  final DonationItem item;
  final UserSahara user;
  final DateTime arrDate;

  const InTransitCard(
      {super.key,
      required this.user,
      required this.item,
      required this.arrDate});
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
              child: Row(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        // border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amberAccent,
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'))),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  Expanded(
                    // ignore: avoid_unnecessary_containers
                    child: ItemDetails(item: item),
                  )
                ],
              ),
            ),
            // Black line seperating top inf and bottom info
            Container(
              height: 0.5,
              decoration: const BoxDecoration(color: Colors.black),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: DeliveryInformation(
                    arrDate: arrDate, item: item, user: user))
          ],
        ),
      ),
    );
  }
}

class ItemDetails extends StatelessWidget {
  const ItemDetails({
    super.key,
    required this.item,
  });

  final DonationItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CardRowDesc(label: 'Name', input: item.name),
          CardRowDesc(
              label: 'Used Duration', input: item.usedDuration.toString()),
          CardRowDesc(label: 'Usability', input: '${item.useability}%'),
          CardRowDesc(label: 'Price', input: "฿${item.price}")
        ],
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
  final DateTime arrDate;

  const ToDeliverCard(
      {super.key,
      required this.user,
      required this.item,
      required this.arrDate});

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
              child: Row(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        // border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amberAccent,
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'))),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  Expanded(child: ItemDetails(item: item))
                ],
              ),
            ),
            // Black line seperating top inf and bottom info
            Container(
              height: 0.5,
              decoration: const BoxDecoration(color: Colors.black),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: DeliveryInformationPickUp(
                    item: item, user: user, arrDate: arrDate))
          ],
        ),
      ),
    );
  }
}

class ToReceiveCard extends StatelessWidget {
  final DonationItem item;
  final UserSahara user;
  final DateTime arrDate;
  const ToReceiveCard(
      {super.key,
      required this.item,
      required this.user,
      required this.arrDate});

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
              child: Row(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        // border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amberAccent,
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'))),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  Expanded(child: ItemDetails(item: item))
                ],
              ),
            ),
            // Black line seperating top inf and bottom info
            Container(
              height: 0.5,
              decoration: const BoxDecoration(color: Colors.black),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: DeliveryInformation(
                    item: item, user: user, arrDate: arrDate))
          ],
        ),
      ),
    );
  }
}

class DeliveredCard extends StatelessWidget {
  final DonationItem item;
  final UserSahara user;
  final DateTime arrDate;

  const DeliveredCard(
      {super.key,
      required this.user,
      required this.item,
      required this.arrDate});
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
              child: Row(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        // border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amberAccent,
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'))),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  Expanded(
                    // ignore: avoid_unnecessary_containers
                    child: ItemDetails(item: item),
                  )
                ],
              ),
            ),
            // Black line seperating top inf and bottom info
            Container(
              height: 0.5,
              decoration: const BoxDecoration(color: Colors.black),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: DeliveryInformationDelivered(
                    arrDate: arrDate, item: item, user: user)),
            Container(
              height: 0.5,
              decoration: const BoxDecoration(color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: primary),
                    onPressed: () => Get.toNamed(Routes.review),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        'Review',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    )),
              ),
            )
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
        Container(
            child: const Text(
          'Delivery Information',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        CardRowDesc(label: 'Name', input: user.name),
        CardRowDesc(label: 'Phone', input: user.phone),
        CardRowDesc(label: 'Delivery Fee', input: "฿${item.deliveryFees}"),
        CardRowDesc(label: 'Address', input: user.address),
        CardRowDesc(label: 'Expected Arrival Date', input: arrDate.toString())
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
        Container(
            child: const Text(
          'Delivery Information',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        CardRowDesc(label: 'Name', input: user.name),
        CardRowDesc(label: 'Phone', input: user.phone),
        CardRowDesc(label: 'Delivery Fee', input: "฿${item.deliveryFees}"),
        CardRowDesc(label: 'Address', input: user.address),
        CardRowDesc(label: 'Pick Up Date', input: arrDate.toString())
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
        Container(
            child: const Text(
          'Delivery Information',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        CardRowDesc(label: 'Name', input: user.name),
        CardRowDesc(label: 'Phone', input: user.phone),
        CardRowDesc(label: 'Delivery Fee', input: "฿${item.deliveryFees}"),
        CardRowDesc(label: 'Address', input: user.address),
        CardRowDesc(label: 'Expected Arrival Date', input: arrDate.toString()),
      ],
    );
  }
}
