import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/components/app_bar_feed_page.dart';
import 'package:sahara/components/app_bottom_nav_bar.dart';
import 'package:sahara/components/Feed/donation_card.dart';
import 'package:sahara/components/Feed/review_card.dart';
import 'package:sahara/models/donation_post.dart';

import '../controllers/nav_bar_controller.dart';
import '../models/review.dart';

class FeedView extends StatelessWidget {
  FeedView({super.key});
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
                Column(children: [
                  ReviewCard(
                    donationPost: donationPost,
                    review: review,
                  )
                ]),
                Column(children: [DonationCard(donationPost: donationPost)]),
              ],
            )),
      ),
    );
  }
}
