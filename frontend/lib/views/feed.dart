import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/Feed/donation_card.dart';
import '../components/Feed/review_card.dart';
import '../components/app_bar_feed_page.dart';
import '../controllers/donation_item_controller.dart';
import '../models/donation_item.dart';

class FeedView extends StatelessWidget {
  FeedView({super.key});
  final donationItemController = DonationItemController.instance;
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
                Obx(() => ListView.separated(
                    itemBuilder: (context, index) {
                      return ReviewCard(
                          donationPost: DonationItem.getFromId(
                              donationItemController
                                  .reviewList[index].donationId,
                              donationItemController.donationItems),
                          review: donationItemController.reviewList[index]);
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: donationItemController.reviewList.length)),
                Obx(
                  () => ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: donationItemController.donationItems.length,
                      itemBuilder: (context, index) {
                        return DonationCard(
                            donationPost:
                                donationItemController.donationItems[index]);
                      }),
                )
              ],
            )),
      ),
    );
  }
}
