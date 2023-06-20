import 'package:flutter/material.dart';

import '../../components/primary_button.dart';
import '../../components/textfield_head.dart';
import '../../theme/app_theme.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Phone Number"),
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
                      headText: "Current Password"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextfieldWithHead(
                      hintText: "Enter new password",
                      textStyle: formFieldText(),
                      borderColor: defaultTextColor,
                      headText: "New password"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextfieldWithHead(
                      hintText: "Enter new password",
                      textStyle: formFieldText(),
                      borderColor: defaultTextColor,
                      headText: "Confirm New Password"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: PrimaryButton(onPressed: () {}, text: "Change"),
                )
              ],
            )),
      ),
    );
  }
}
