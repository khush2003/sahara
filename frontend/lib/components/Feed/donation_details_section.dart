import 'package:flutter/material.dart';

import '../../models/donation_item.dart';
import '../../theme/app_theme.dart';
import '../../utils/app_utils.dart';
import '../image_thumbnail.dart';
import '../tag.dart';
import 'donation_card.dart';

class DonationDetailSection extends StatelessWidget {
  final DonationItem item;
  final bool showDescription, showTags;
  final bool showOverPricedWarning;
  final bool showHalfDelivery;
  const DonationDetailSection(
      {super.key,
      required this.item,
      this.showDescription = true,
      this.showTags = true,
      this.showOverPricedWarning = true,
      this.showHalfDelivery = false,});

  @override
  Widget build(BuildContext context) {
    var deliveryFees = item.deliveryPaidBy == DeliveryPaidBy.both
        ? item.deliveryFees / 2
        : item.deliveryFees;
    var showDeliveryFees = showHalfDelivery ? deliveryFees : item.deliveryFees;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (item.isOverPriced && showOverPricedWarning)
          WarningOverPriced(
              deliveryFees: item.deliveryFees,
              estimatedItemValue: item.estimatedItemValue),
        const SizedBox(height: 5),
        Row(
          children: [
            ImageThumbnail(imageUrl: item.imageUrl),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                DetailRow(label: 'Name', value: item.name),
                DetailRow(
                    label: 'Used Duration',
                    value: formatDuration(item.usedDuration)),
                DetailRow(
                    label: 'Usability', value: '${(item.usability * 100).toStringAsFixed(2)}%'),
                DetailRow(label: 'Price', value: '${item.price} bhat'),
                DetailRow(
                    label: 'Delivery Paid By',
                    value: convertToString(item.deliveryPaidBy)),
                DetailRow(
                    label: 'Delivery Fees', value: '$showDeliveryFees bhat'),
                DetailRow(label: 'Estmated Value', value: '${item.estimatedItemValue.round()} bhat'),
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
            item.description,
            style: const TextStyle(
                fontWeight: FontWeight.w300, fontSize: 24, height: 0.7),
          ),
        if (showTags) createTags(item.tags)
      ],
    );
  }
}

Widget createTags(List<String> tags) {
  final tagsWidgets = <Widget>[];
  for (int i = 0; i < tags.length; i++) {
    tagsWidgets.add(Tag(tags[i]));
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
