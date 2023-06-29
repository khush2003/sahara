import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/controllers/counpon_controller.dart';

import '../../components/primary_button.dart';
import '../../routes/routes.dart';

class ProfileSettingView extends StatelessWidget {
  ProfileSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Setting"),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: PrimaryButton(
                      onPressed: () {
                        Get.toNamed(Routes.changeUsername);
                      },
                      text: "Update Username"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: PrimaryButton(
                      onPressed: () {
                        Get.toNamed(Routes.changePhoneNumber);
                      },
                      text: "Update Phone number"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: PrimaryButton(
                      onPressed: () {
                        Get.toNamed(Routes.changeAddress);
                      },
                      text: "Update Address"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: PrimaryButton(
                      onPressed: () {
                        Get.toNamed(Routes.changePassword);
                      },
                      text: "Update Password"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
