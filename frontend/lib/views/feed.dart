import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/controllers/auth/auth_controller.dart';
import 'package:sahara/theme/app_theme.dart';

import '../components/Feed/donation_card.dart';
import '../components/Feed/review_card.dart';
import '../components/app_bar_feed_page.dart';
import '../controllers/donation_item_controller.dart';
import '../models/donation_item.dart';

class FeedView extends StatelessWidget {
  FeedView({super.key});
  final donationItemController = DonationItemController.instance;
  final auth = AuthController.instance;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBarFeedPage(),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBarView(
              children: [
                Obx(() {
                  if (donationItemController.reviewList.isEmpty) {
                    return Center(
                        child: Text("No Reviews Found", style: headTextBold()));
                  }
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return ReviewCard(
                            item: DonationItem.getFromId(
                                donationItemController
                                    .reviewList[index].donationId,
                                donationItemController.donationItems),
                            review: donationItemController.reviewList[index]);
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: donationItemController.reviewList.length);
                }),
                Obx(() {
                  if (donationItemController.filteredList.isEmpty) {
                    return Center(
                        child: Text("No Items Found", style: headTextBold()));
                  }
                  return ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: donationItemController.filteredList.length,
                      itemBuilder: (context, index) {
                        return DonationCard(
                            item: donationItemController.filteredList[index],
                            showChatButton: donationItemController.filteredList[index].author.authorId == auth.userSahara.value.uid! ? false : true,);
                      });
                })
              ],
            )),
      ),
    );
  }
}
