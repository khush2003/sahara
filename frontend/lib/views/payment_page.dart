import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/components/Feed/donation_details_section.dart';
import 'package:sahara/controllers/payment_controller.dart';
import 'package:sahara/views/create_donation.dart';

import '../models/donation_item.dart';

class PaymentPage extends StatelessWidget {
  final controller = Get.put(PaymentController());
  PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: ListView(
        children: [
          CardItemInfo(item: controller.item.value),
          QRCard(),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                  height: 400,
                  child: Obx(
                    () => UploadImageButton(
                        image: controller.imageUrl.value,
                        onPressed: controller.uploadImage),
                  ))),
          const Padding(padding: EdgeInsets.all(16)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GiveButton(
              controller: controller,
            ),
          )
        ],
      ),
    );
  }
}

class CardItemInfo extends StatelessWidget {
  final DonationItem item;
  const CardItemInfo({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            )
          ],
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DonationDetailSection(
            item: item,
            showDescription: false,
            showTags: false,
            showOverPricedWarning: false,
            showHalfDelivery: true,
          ),
        ),
      ),
    );
  }
}

class QRCard extends StatelessWidget {
  QRCard({super.key});
  final DonationItem item = DonationItem.test();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 500,
        decoration: const BoxDecoration(
            // color: Colors.amberAccent,
            image: DecorationImage(
                image: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/sahara-9a91b.appspot.com/o/images%2Fqr_payment.png?alt=media&token=1505cd73-866f-43e4-aab7-ef2e3d41cd9c'))),
      ),
    );
  }
}

class ImageInput extends StatelessWidget {
  const ImageInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 200,
        child: OutlinedButton.icon(
          icon: const Icon(Icons.image),
          onPressed: () {},
          label: const Text('Add Image'),
          style: ElevatedButton.styleFrom(
            side: const BorderSide(
              color: Colors.black, //Set border color
              width: 1, //Set border width
            ),
          ),
        ),
      ),
    );
  }
}

class GiveButton extends StatelessWidget {
  final PaymentController controller;
  const GiveButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: controller.give,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
          child: Text(
            'Give',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ));
  }
}
