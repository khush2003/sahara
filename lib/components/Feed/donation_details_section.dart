
import 'package:flutter/material.dart';
import 'package:sahara/components/Feed/donation_card.dart';
import 'package:sahara/components/image_thumbnail.dart';
import 'package:sahara/models/donation_post.dart';
import 'package:sahara/theme/app_theme.dart';
import 'package:sahara/utils/app_utils.dart';

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
                    label: 'Useability',
                    value: '${donationPost.useability * 100}%'),
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
      Container(
          decoration: BoxDecoration(
            border: Border.all(color: primary, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Text(
              '#${tags[i]}',
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
            ),
          ])),
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