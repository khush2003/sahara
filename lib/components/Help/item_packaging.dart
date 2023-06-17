import 'package:flutter/material.dart';

class ItemPackaging extends StatelessWidget {
  const ItemPackaging({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Packaging'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Item Packaging',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'When our delivery service arrives at the donor\'s house to pick up the donated item, we want to ensure a hassle-free experience for our generous donors. That\'s why we take care of the packaging process on your behalf!',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Donors are not required to package the items before the pickup. Our trained personnel will carefully handle the items and professionally package them to ensure their safety during transit. You can trust us to take every precaution necessary to protect your donation.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'We understand that packaging can be time-consuming and sometimes challenging, especially for larger or fragile items. Therefore, our dedicated team takes full responsibility for the packaging process, allowing you to focus on the act of giving without any additional stress or effort.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'The best part? There is no extra fee for packaging! We believe in making the donation process as convenient and cost-effective as possible. Your generosity should be rewarded, and we take pride in providing exceptional service at no additional cost.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
