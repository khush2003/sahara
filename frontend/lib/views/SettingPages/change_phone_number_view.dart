import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/controllers/change_settings/change_details_controller.dart';
import 'package:sahara/utils/app_utils.dart';

import '../../components/primary_button.dart';
import '../../components/textfield_head.dart';
import '../../theme/app_theme.dart';

class ChangePhoneNumberView extends StatelessWidget {
  ChangePhoneNumberView({super.key});
  final changeController = Get.put(ChangeUserDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Phone Number"),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        textAlign: TextAlign.left,
                        "Your current phone number :",
                        style: headTextBold(),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          changeController.user.value.userPhoneNumber
                                      ?.trim()
                                      .isEmpty ??
                                  true
                              ? "No phone number"
                              : changeController.user.value.userPhoneNumber!,
                          style: headText().copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextfieldWithHead(
                        hintText: "Enter new phone number",
                        textStyle: formFieldText(),
                        borderColor: defaultTextColor,
                        headText: "New Phone Number",
                        controllerFunction:
                            changeController.userPhoneNumberController,
                        validator: changeController.validatePhoneNumber),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: PrimaryButton(
                        onPressed: () {
                          if (changeController.validatePhoneNumber(
                                  changeController
                                      .userPhoneNumberController.text
                                      .trim()) ==
                              null) {
                            changeController.changeNonAuthUserDetails();
                          } else {
                            errorSnackBar("Please enter a valid phone number");
                          }
                        },
                        text: "Update"),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
