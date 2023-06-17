import 'package:flutter/material.dart';
import 'package:sahara/models/author.dart';
import 'package:sahara/models/donation_post.dart';
import 'package:sahara/models/user.dart';
import 'package:sahara/theme/app_theme.dart';
import 'package:sahara/utils/app_utils.dart';
import 'package:sahara/utils/uni_icon.dart';
import 'package:unicons/unicons.dart';

class DonationDetailsSectionDetailed extends StatelessWidget {
  final Author author;
  final DonationItem item;

  const DonationDetailsSectionDetailed(
      {super.key, required this.author, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Center(child: Text('Refigerator', style: titleText())),
        InfoRow(
            icon: UniconsLine.clock,
            label: 'Used Duration',
            value: formatDuration(item.usedDuration)),
        InfoRow(
            icon: UniconsLine.star,
            label: 'Useability',
            value: '${item.useability * 100}%'),
        InfoRow(
            icon: UniconsLine.bitcoin_circle,
            label: 'Price',
            value: '${item.price} bhat'),
        InfoRow(
            icon: UniconsLine.parcel,
            label: 'Delivery Fees',
            value: '${item.deliveryFees} bhat'),
      ],
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const InfoRow(
      {super.key,
      required this.icon,
      required this.label,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      child: Row(
        children: [
          UnIcon(
            icon,
            size: 40,
          ),
          const SizedBox(width: 10),
          Text(label, style: headTextBold()),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }
}
