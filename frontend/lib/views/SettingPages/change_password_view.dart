import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/controllers/change_settings/change_details_controller.dart';

import '../../components/primary_button.dart';
import '../../components/textfield_head.dart';
import '../../theme/app_theme.dart';

class ChangePasswordView extends StatelessWidget {
  ChangePasswordView({super.key});
  final changeController = Get.put(ChangeUserDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Password"),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextfieldWithHead(
                      hintText: "Enter current password",
                      textStyle: formFieldText(),
                      borderColor: defaultTextColor,
                      controllerFunction:
                          changeController.currentPasswordController,
                      secureText: true,
                      headText: "Current Password"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextfieldWithHead(
                      hintText: "Enter new password",
                      textStyle: formFieldText(),
                      borderColor: defaultTextColor,
                      controllerFunction:
                          changeController.newPasswordController,
                      secureText: true,
                      headText: "New password"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextfieldWithHead(
                      hintText: "Enter new password",
                      textStyle: formFieldText(),
                      borderColor: defaultTextColor,
                      controllerFunction:
                          changeController.confirmPasswordController,
                      secureText: true,
                      headText: "Confirm New Password"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: PrimaryButton(
                      onPressed: () => changeController.changeUserPassword(),
                      text: "Update"),
                )
              ],
            )),
      ),
    );
  }
}
