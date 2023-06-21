import 'package:flutter/material.dart';

import '../components/Feed/donation_card.dart';
import '../components/Feed/review_card.dart';
import '../components/app_bar_feed_page.dart';
import '../models/donation_item.dart';
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
