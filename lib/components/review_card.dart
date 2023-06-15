import 'package:flutter/material.dart';
import 'package:sahara/components/card_with_shadow.dart';
import 'package:sahara/models/donation_post.dart';

import '../models/review.dart';
import 'donation_card.dart';

class ReviewCard extends StatelessWidget {
  final DonationItem donationPost;
  final Review review;

  const ReviewCard({
    super.key,
    required this.donationPost,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return CardSahara(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          AutherDetailSection(
            author: donationPost.author,
            showChatButton: false,
          ),
          const Divider(),
          DonationDetailSection(
              showOverPricedWarning: false,
              donationPost: donationPost,
              showDescription: false,
              showTags: false),
          const Divider(),
          ReviewSection(review: review),
          const SizedBox(height: 5)
        ],
      ),
    ));
  }
}

class ReviewSection extends StatelessWidget {
  final Review review;
  const ReviewSection({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ImageThumbnail(
                imageUrl: review.imageUrl, isCircular: true, size: 45),
            const SizedBox(width: 10),
            Text(
              review.name,
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
          style: const TextStyle(
              fontWeight: FontWeight.w300, fontSize: 24, height: 0.7),
        )
      ],
    );
  }
}
