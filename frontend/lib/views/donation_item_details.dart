import 'package:flutter/material.dart';

import '../components/Feed/author_detail_section.dart';
import '../components/Feed/donation_details_section.dart';
import '../components/Feed/donation_details_section_detailed.dart';
import '../components/image_thumbnail.dart';
import '../models/author.dart';
import '../models/donation_post.dart';
import '../models/user.dart';
import '../theme/app_theme.dart';

class DonationItemDetailsView extends StatelessWidget {
  DonationItemDetailsView({super.key});
  final Author author = Author.test();
  final UserSahara user = UserSahara.test();
  final DonationItem item = DonationItem.test();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Donation Details'),
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: AutherDetailSection(author: author),
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
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text('Description', style: headTextBold()),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(item.description, style: regularText(height: 0.7)),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: createTags(item.tags),
            ),
           
          ],
        )));
  }
}
