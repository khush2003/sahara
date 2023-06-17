import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/theme/app_theme.dart';
import 'package:unicons/unicons.dart';

import '../components/Help/contact_us.dart';
import '../routes/routes.dart';
import '../components/Help/how_to_donate_used_item.dart';
import '../components/Help/how_to_pay_delivery_fee.dart';
import '../components/Help/how_to_measure_your_item.dart';
import '../components/Help/how_delivery_service_work.dart';
import '../components/Help/item_packaging.dart';
import '../utils/uni_icon.dart';

class Help extends StatelessWidget {
  const Help({super.key});
  void navigateToTopic(BuildContext context, String topic) {
    if (topic == 'How to donate used item?') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HowToDonateUsedItem()),
      );
    } else if (topic == 'How to measure your item?') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HowToMeasureYourItem()),
      );
    } else if (topic == 'How to pay delivery fee?') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HowToPayDeliveryFee()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const ItemDonation(),
              const SizedBox(
                height: 10,
              ),
              const DeliveryService(),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ContactUs()),
                        );
                      },
                      label: const Text(
                        'Contact Us',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      icon: const Icon(
                        Icons.contact_phone_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

class ItemDonation extends StatelessWidget {
  const ItemDonation({super.key});
  void navigateToTopic(BuildContext context, String topic) {
    if (topic == 'How to donate used item?') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HowToDonateUsedItem()),
      );
    } else if (topic == 'How to measure your item?') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HowToMeasureYourItem()),
      );
    } else if (topic == 'How to pay delivery fee?') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HowToPayDeliveryFee()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffffc736),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 0.0,
                        right: 0.0,
                        top: 8.0,
                        bottom: 0.0,
                      ),
                      child: Text(
                        'Item Donation',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 0.0,
              top: 8.0,
              bottom: 0.0,
            ),
            child: GestureDetector(
              onTap: () => navigateToTopic(context, 'How to donate used item?'),
              child: const Text(
                'How to donate used item?',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ),
          Container(
            height: 1,
            color: const Color(0xff9a9a9a),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 0.0,
              top: 8.0,
              bottom: 0.0,
            ),
            child: GestureDetector(
              onTap: () =>
                  navigateToTopic(context, 'How to measure your item?'),
              child: const Text(
                'How to measure your item?',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ),
          Container(
            height: 1,
            color: const Color(0xff9a9a9a),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 0.0,
              top: 8.0,
              bottom: 0.0,
            ),
            child: GestureDetector(
              onTap: () => navigateToTopic(context, 'How to pay delivery fee?'),
              child: const Text(
                'How to pay delivery fee?',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DeliveryService extends StatelessWidget {
  const DeliveryService({super.key});
  void navigateToTopic(BuildContext context, String topic) {
    if (topic == 'How delivery service works?') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HowDeliveryServiceWorks()),
      );
    } else if (topic == 'Item packaging') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ItemPackaging()),
      );
    } else if (topic == 'How to pay delivery fee?') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HowToPayDeliveryFee()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffffc736),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 0.0,
                        right: 0.0,
                        top: 8.0,
                        bottom: 0.0,
                      ),
                      child: Text(
                        'Delivery Service',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 0.0,
              top: 8.0,
              bottom: 0.0,
            ),
            child: GestureDetector(
              onTap: () =>
                  navigateToTopic(context, 'How delivery service works?'),
              child: const Text(
                'How delivery service works?',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ),
          Container(
            height: 1,
            color: const Color(0xff9a9a9a),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 0.0,
              top: 8.0,
              bottom: 0.0,
            ),
            child: GestureDetector(
              onTap: () => navigateToTopic(context, 'Item packaging'),
              child: const Text(
                'Item packaging',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
