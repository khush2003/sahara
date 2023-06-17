import 'package:flutter/material.dart';
import 'package:sahara/components/Feed/upload_address_popup.dart';
import 'package:sahara/models/user.dart';

class CreateDonationView extends StatelessWidget {
  CreateDonationView({super.key});
  final user = UserSahara(name: 'H');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Donation Post'),
      ),
      body: const Center(
        child: ElevatedButton(
          onPressed: showUploadAddressDialog,
          child: Text('Upload Address'),
        ),
      ),
    );
  }
}
