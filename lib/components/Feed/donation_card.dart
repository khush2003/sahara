import 'package:flutter/material.dart';
import 'package:sahara/components/card_with_shadow.dart';
import 'package:sahara/models/author.dart';
import 'package:sahara/models/donation_post.dart';
import 'package:sahara/theme/app_theme.dart';
import 'package:sahara/utils/app_utils.dart';
import 'package:sahara/utils/uni_icon.dart';
import 'package:unicons/unicons.dart';

class DonationCard extends StatelessWidget {
  final DonationItem donationPost;

  const DonationCard({
    super.key,
    required this.donationPost,
  });

  @override
  Widget build(BuildContext context) {
    return CardSahara(
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
        Text('$label: ', style: regularTextBold()),
        Text(value, style: regularText()),
      ],
    );
  }
}

class ImageThumbnail extends StatelessWidget {
  final String imageUrl;
  final double size;
  final bool isCircular;
  const ImageThumbnail(
      {super.key,
      required this.imageUrl,
      this.size = 125,
      this.isCircular = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            border: Border.all(color: isCircular ? sucess : Colors.black),
            borderRadius: isCircular
                ? BorderRadius.circular(5000)
                : BorderRadius.circular(10),
            color: Colors.amberAccent,
            image: DecorationImage(image: NetworkImage(imageUrl))));
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

class AutherDetailSection extends StatelessWidget {
  final Author author;
  final bool showChatButton;
  const AutherDetailSection(
      {super.key, required this.author, this.showChatButton = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageThumbnail(imageUrl: author.imageUrl, isCircular: true, size: 45),
        const SizedBox(width: 10),
        Text(
          author.name,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 32),
        ),
        const Spacer(),
        if (showChatButton)
          IconButton(onPressed: () {}, icon: const UnIcon(UniconsLine.comment))
      ],
    );
  }
}
