import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/Feed/author_detail_section.dart';
import '../components/Feed/donation_details_section.dart';
import '../components/Feed/donation_details_section_detailed.dart';
import '../components/Feed/review_card.dart';
import '../components/image_thumbnail.dart';
import '../controllers/donation_item_controller.dart';
import '../models/donation_item.dart';
import '../models/review.dart';
import '../theme/app_theme.dart';

class ReviewPostDetailsView extends StatelessWidget {
  ReviewPostDetailsView({super.key});
  final controller = DonationItemController.instance;
  final reviewId = Get.parameters['id'] ?? '';
  @override
  Widget build(BuildContext context) {
    final review = Review.getFromId(reviewId, controller.reviewList);
    final item =
        DonationItem.getFromId(review.donationId, controller.donationItems);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Review Details'),
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: AutherDetailSection(
                  author: item.author, showChatButton: false),
            ),
            ImageThumbnail(
                fixedHeight: 300,
                isFlat: true,
                imageUrl: 'https://picsum.photos/200',
                size: MediaQuery.of(context).size.width),
            DonationDetailsSectionDetailed(
              author: item.author,
              item: item,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(),
                    Text('Description', style: headTextBold()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(item.description,
                          style: regularText(height: 0.7)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: createTags(item.tags),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: ReviewSection(
                        review: review,
                      ),
                    ),
                    const SizedBox(height: 15)
                  ],
                )),
          ],
        )));
  }
}
