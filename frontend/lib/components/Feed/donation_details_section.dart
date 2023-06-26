
import 'package:flutter/material.dart';

import '../../models/donation_item.dart';
import '../../theme/app_theme.dart';
import '../../utils/app_utils.dart';
import '../image_thumbnail.dart';
import '../tag.dart';
import 'donation_card.dart';

class DonationDetailSection extends StatelessWidget {
  final DonationItem donationPost;
  final bool showDescription, showTags;
  final bool showOverPricedWarning;
  const DonationDetailSection(
      {super.key,
      required this.donationPost,
      this.showDescription = true,
      this.showTags = true,
      this.showOverPricedWarning = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (donationPost.isOverPriced && showOverPricedWarning)
          WarningOverPriced(
              deliveryFees: donationPost.deliveryFees,
              estimatedItemValue: donationPost.estimatedItemValue),
        const SizedBox(height: 5),
        Row(
          children: [
            ImageThumbnail(imageUrl: donationPost.imageUrl),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                DetailRow(label: 'Name', value: donationPost.name),
                DetailRow(
                    label: 'Used Duration',
                    value: formatDuration(donationPost.usedDuration)),
                DetailRow(
                    label: 'Usability',
                    value: '${donationPost.usability * 100}%'),
                DetailRow(label: 'Price', value: '${donationPost.price} bhat'),
                DetailRow(
                    label: 'Delivery Fees',
                    value: '${donationPost.deliveryFees} bhat'),
              ],
            )
          ],
        ),
        if (showDescription) const SizedBox(height: 15),
        if (showDescription)
          Text(
            'Description',
            style: regularTextBold(),
          ),
        if (showDescription)
          Text(
            donationPost.description,
            style: const TextStyle(
                fontWeight: FontWeight.w300, fontSize: 24, height: 0.7),
          ),
        if (showTags) createTags(donationPost.tags)
      ],
    );
  }
}

Widget createTags(List<String> tags) {
  final tagsWidgets = <Widget>[];
  for (int i = 0; i < tags.length; i++) {
    tagsWidgets.add(
      Tag(tags[i])
    );
  }
  return Wrap(
    direction: Axis.horizontal,
    alignment: WrapAlignment.start,
    runAlignment: WrapAlignment.start,
    spacing: 10,
    runSpacing: 10,
    children: tagsWidgets,
  );
}