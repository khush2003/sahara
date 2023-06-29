import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/routes/routes.dart';
import '../../theme/app_theme.dart';
import '../primary_button.dart';

void showUploadAddressDialog({bool isReciever = false}) {
  String donateType = isReciever ? 'recieve' : 'donate';
  final List<Widget> content = [
    const Center(
      child: Text(
        'Upload Address',
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
      ),
    ),
    const Divider(),
    Padding(
      padding: const EdgeInsets.all(11.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "You need to have contact information to $donateType items. You can add address and phone number in the setting.",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 32, fontWeight: FontWeight.w400, height: 0.5),
            ),
          ),
          PrimaryButton(
              onPressed: () {
                Get.toNamed(Routes.profileSetting);
              },
              text: 'Go to Settings'),
          const SizedBox(height: 15),
          OutlinedButton(
              onPressed: () {
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  // fixedSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text('Cancel',
                  style: titleText(color: Colors.black, height: 1.3))),
        ],
      ),
    )
  ];

  Get.dialog(SimpleDialog(
      insetPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      children: content));
}
