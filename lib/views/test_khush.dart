import 'package:flutter/material.dart';
import 'package:sahara/components/app_bar_feed_page.dart';
import 'package:sahara/components/app_bottom_nav_bar.dart';
import 'package:sahara/components/donation_card.dart';
import 'package:sahara/components/review_card.dart';
import 'package:sahara/models/donation_post.dart';

import '../models/review.dart';

class TestKhush extends StatelessWidget {
  TestKhush({super.key});
  final DonationItem donationPost = DonationItem.test();
  final Review review = Review.test();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const AppBarFeedPage(),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBarView(
              children: [
                Column(children: [ReviewCard(donationPost: donationPost, review: review,)]),
                Column(children: [DonationCard(donationPost: donationPost)]),
              ],
            )),
        bottomNavigationBar: const AppBottomNavBar(),
      ),
    );
  }
}
