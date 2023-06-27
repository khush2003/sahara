import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/controllers/change_settings/change_details_controller.dart';
import 'package:sahara/utils/app_utils.dart';

import '../../components/primary_button.dart';
import '../../components/textfield_head.dart';
import '../../theme/app_theme.dart';

class ChangeUsernameView extends StatelessWidget {
  ChangeUsernameView({super.key});
  final changeController = Get.put(ChangeUserDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Username"),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      textAlign: TextAlign.left,
                      "Your current username :",
                      style: headTextBold(),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: changeController.buildPhoneNumberWidget(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextfieldWithHead(
                    hintText: "Enter new username",
                    textStyle: formFieldText(),
                    borderColor: defaultTextColor,
                    headText: "New Username",
                    controllerFunction: changeController.userNameController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: PrimaryButton(
                      onPressed: () async {
                        if (await changeController.isAvailableUserName(
                            changeController.userNameController.text)) {
                          changeController.changeNonAuthUserDetails();
                        } else {
                          errorSnackBar(
                              'This username has already been used. Please choose a different one');
                        }
                      },
                      text: "Update"),
                )
              ],
            )),
      ),
    );
  }
}
