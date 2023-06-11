import 'package:flutter/material.dart';
import 'package:sahara/components/donation_card.dart';
import 'package:sahara/models/author.dart';
import 'package:sahara/models/donation_post.dart';
import 'package:sahara/utils/app_utils.dart';

class TestKhush extends StatelessWidget {
  TestKhush({super.key});
  final DonationPost donationPost = DonationPost.test();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [DonationCard(donationPost: donationPost)]),
    ));
  }
}
