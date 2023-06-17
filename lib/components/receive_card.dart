import 'package:flutter/material.dart';
import 'package:sahara/models/author.dart';
import 'package:sahara/models/donation_post.dart';
import 'package:sahara/utils/uni_icon.dart';
import 'package:unicons/unicons.dart';

class ReceivedCard extends StatelessWidget {
  final DonationItem donationPost;

  const ReceivedCard({
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
            Donor(author: donationPost.author),
            const Divider(),
            DonationDetailSection(donationPost: donationPost),
            const Divider(),
            Receiver(author: donationPost.author, donationPost: donationPost),
          ],
        ));
  }
}

class DonationDetailSection extends StatelessWidget {
  final DonationItem donationPost;
  const DonationDetailSection({super.key, required this.donationPost});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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

class Donor extends StatelessWidget {
  final Author author;
  const Donor({super.key, required this.author});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageThumbnail(imageUrl: author.imageUrl),
        Text(author.name),
      ],
    );
  }
}

class Receiver extends StatelessWidget {
  final DonationItem donationPost;
  final Author author;
  const Receiver({super.key, required this.author, required this.donationPost});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ImageThumbnail(imageUrl: author.imageUrl),
            Text(author.name),
            const Spacer(),
            const Icon(Icons.star_rate_rounded),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: Text(
                donationPost.description,
                overflow:
                    TextOverflow.ellipsis, // Add this line to handle overflow
              ),
            ),
          ],
        ),
      ],
    );
  }
}
