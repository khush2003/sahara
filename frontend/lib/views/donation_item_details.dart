import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/controllers/donation_details_controller.dart';

import '../components/Feed/author_detail_section.dart';
import '../components/Feed/donation_details_section.dart';
import '../components/Feed/donation_details_section_detailed.dart';
import '../components/image_thumbnail.dart';
import '../theme/app_theme.dart';

class DonationItemDetailsView extends StatelessWidget {
  DonationItemDetailsView({super.key});
  final DonationDetailsController controller =
      Get.put(DonationDetailsController());
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
              child:
                  AutherDetailSection(author: controller.donationItem.author),
            ),
            ImageThumbnail(
                fixedHeight: 300,
                isFlat: true,
                imageUrl: controller.donationItem.imageUrl,
                size: MediaQuery.of(context).size.width),
            DonationDetailsSectionDetailed(
              author: controller.donationItem.author,
              item: controller.donationItem,
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text('Description', style: headTextBold()),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(controller.donationItem.description,
                  style: regularText(height: 0.7)),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: createTags(controller.donationItem.tags),
            ),
          ],
        )));
  }
}
