import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/donation_item.dart';
import '../../routes/routes.dart';
import '../card_with_shadow.dart';
import '../image_thumbnail.dart';
import 'author_detail_section.dart';

import '../../models/review.dart';
import 'donation_details_section.dart';

class ReviewCard extends StatelessWidget {
  final DonationItem item;
  final Review review;

  const ReviewCard({
    super.key,
    required this.item,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return CardSahara(
        onPressed: () => Get.toNamed(Routes.reviewDetails, parameters: {
              'id': review.reviewId!,
            }),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              AutherDetailSection(
                author: item.author,
                showChatButton: false, item: item,
              ),
              const Divider(),
              DonationDetailSection(
                  showOverPricedWarning: false,
                  item: item,
                  showDescription: false,
                  showTags: false),
              const Divider(),
              ReviewSection(review: review, maxLines: 3),
              const SizedBox(height: 5)
            ],
          ),
        ));
  }
}

class ReviewSection extends StatelessWidget {
  final int? maxLines;
  final Review review;
  const ReviewSection({super.key, required this.review, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ImageThumbnail(
                imageUrl: review.reviewerImageURL, isCircular: true, size: 45),
            const SizedBox(width: 10),
            Text(
              review.reviewerName,
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 32),
            ),
            const Spacer(),
            // IconButton(onPressed: () {}, icon: const UnIcon(UniconsLine.comment))
          ],
        ),
        const SizedBox(height: 10),
        Text(
          review.reviewText,
          maxLines: maxLines,
          overflow: maxLines != null ? TextOverflow.ellipsis : null,
          style: const TextStyle(
              fontWeight: FontWeight.w300, fontSize: 24, height: 0.7),
        )
      ],
    );
  }
}
