import 'package:flutter/material.dart';
import 'package:sahara/models/author.dart';
import 'package:sahara/models/donation_post.dart';
import 'package:sahara/utils/uni_icon.dart';
import 'package:unicons/unicons.dart';

class DonationCard extends StatelessWidget {
  final DonationPost donationPost;

  const DonationCard({
    super.key,
    required this.donationPost,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: const [BoxShadow(color: Colors.black87, blurRadius: 5)]),
        child: Column(
          children: [
            DonationDetailSection(donationPost: donationPost),
            const Divider(),
            AutherDetailSection(author: donationPost.author),
          ],
        ));
  }
}

class DonationDetailSection extends StatelessWidget {
  final DonationPost donationPost;
  const DonationDetailSection({super.key, required this.donationPost});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (donationPost.isOverPriced)
          WarningOverPriced(
              deliveryFees: donationPost.deliveryFees,
              estimatedItemValue: donationPost.estimatedItemValue),
        Row(
          children: [
            ImageThumbnail(imageUrl: donationPost.imageUrl),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailRow(label: 'Name', value: donationPost.name),
                DetailRow(
                    label: 'Used Duration',
                    value: donationPost.usedDuration.toString()),
                DetailRow(
                    label: 'Useability',
                    value: '${donationPost.useability * 100}%'),
                DetailRow(label: 'Price', value: '฿${donationPost.price}'),
                DetailRow(
                    label: 'Delivery Fees',
                    value: '฿${donationPost.deliveryFees}'),
              ],
            )
          ],
        ),
        const Text('Description'),
        Text(donationPost.description),
        // ListView(children: donationPost.tags.map((tag) => Tag(tag)).toList())
      ],
    );
  }
}

class Tag extends StatelessWidget {
  final String tag;
  const Tag(this.tag, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(20)),
        child: Text(tag));
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
        Text('$label: '),
        Text(value),
      ],
    );
  }
}

class ImageThumbnail extends StatelessWidget {
  final String imageUrl;
  const ImageThumbnail({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container();
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
      decoration: BoxDecoration(
          color: Colors.orange, borderRadius: BorderRadius.circular(20)),
      child: Row(children: const [
        UnIcon(UniconsLine.exclamation_triangle),
        Text("Delviery fees is higher than the item value"),
      ]),
    );
  }
}

class AutherDetailSection extends StatelessWidget {
  final Author author;
  const AutherDetailSection({super.key, required this.author});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageThumbnail(imageUrl: author.imageUrl),
        Text(author.name),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.chat))
      ],
    );
  }
}
