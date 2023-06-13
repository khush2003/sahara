import 'package:flutter/material.dart';
import 'package:sahara/models/donation_post.dart';
import 'package:sahara/models/user.dart';

import '../components/delivery_card.dart';

bool showInTransit = true;
bool showToDeliver = false;
bool showPickUp = false;
bool showDelivered = false;

class TestJames extends StatelessWidget {
  TestJames({super.key});
  final DonationItem item = DonationItem.test();
  final UserSahara user = UserSahara.test();
  final arrDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('James View'),),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // InTransitCard(user: user, item: item, arrDate: arrDate)
            DeliveredCard(user: user, item: item, arrDate: arrDate)
          ],
        ),
      ),
    );
  }
}
