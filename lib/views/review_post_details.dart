import 'package:flutter/material.dart';
import 'package:sahara/components/Feed/author_detail_section.dart';
import 'package:sahara/components/Feed/donation_details_section.dart';
import 'package:sahara/components/Feed/donation_details_section_detailed.dart';
import 'package:sahara/components/Feed/review_card.dart';
import 'package:sahara/components/image_thumbnail.dart';
import 'package:sahara/models/author.dart';
import 'package:sahara/models/donation_post.dart';
import 'package:sahara/models/review.dart';
import 'package:sahara/models/user.dart';
import 'package:sahara/theme/app_theme.dart';

class ReviewPostDetailsView extends StatelessWidget {
  ReviewPostDetailsView({super.key});
  final Author author = Author.test();
  final UserSahara user = UserSahara.test();
  final DonationItem item = DonationItem.test();
  final Review review = Review.test();
  @override
  Widget build(BuildContext context) {
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
              child: AutherDetailSection(author: author, showChatButton: false),
            ),
            ImageThumbnail(
                fixedHeight: 300,
                isFlat: true,
                imageUrl: 'https://picsum.photos/200',
                size: MediaQuery.of(context).size.width),
            DonationDetailsSectionDetailed(
              author: author,
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
