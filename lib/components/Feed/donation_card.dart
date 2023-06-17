import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/components/Feed/author_detail_section.dart';
import 'package:sahara/components/card_with_shadow.dart';
import 'package:sahara/models/donation_post.dart';
import 'package:sahara/routes/routes.dart';
import 'package:sahara/theme/app_theme.dart';
import 'package:sahara/utils/uni_icon.dart';
import 'package:unicons/unicons.dart';

import 'donation_details_section.dart';

class DonationCard extends StatelessWidget {
  final DonationItem donationPost;

  const DonationCard({
    super.key,
    required this.donationPost,
  });

  @override
  Widget build(BuildContext context) {
    return CardSahara(
        onPressed: () => Get.toNamed(Routes.donationDetails),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              DonationDetailSection(donationPost: donationPost),
              const Divider(),
              AutherDetailSection(author: donationPost.author),
              const SizedBox(height: 5),
            ],
          ),
        ));
  }
}


class DetailRow extends StatelessWidget {
  const DetailRow({
    super.key,
    required this.label,
    required this.value,
  });

  final String label, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$label: ', style: regularTextBold()),
        Text(value, style: regularText()),
      ],
    );
  }
}


class WarningOverPriced extends StatelessWidget {
  final double deliveryFees, estimatedItemValue;
  const WarningOverPriced({
    super.key,
    required this.deliveryFees,
    required this.estimatedItemValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      decoration: BoxDecoration(
          color: primary, borderRadius: BorderRadius.circular(10)),
      child: Row(children: [
        const UnIcon(
          UniconsSolid.exclamation_triangle,
          size: 20,
          color: Colors.red,
        ),
        const SizedBox(width: 5),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(height: 5),
            Text(
              "Delivery fees is higher than the item value",
              style: TextStyle(fontWeight: FontWeight.normal, height: null),
            ),
          ],
        ),
      ]),
    );
  }
}
