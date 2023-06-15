import 'package:flutter/material.dart';
import 'package:sahara/components/app_bar_feed_page.dart';
import 'package:sahara/components/donation_card.dart';
import 'package:sahara/models/donation_post.dart';

class TestKhush extends StatelessWidget {
  TestKhush({super.key});
  final DonationItem donationPost = DonationItem.test();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const AppBarFeedPage(),
          body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [DonationCard(donationPost: donationPost)]),
      )),
    );
  }
}
