import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/controllers/setting/phoneNumber_update_controller.dart';

import '../../components/primary_button.dart';
import '../../components/textfield_head.dart';
import '../../theme/app_theme.dart';

class ChangePhoneNumberView extends StatelessWidget {
  ChangePhoneNumberView({super.key});

  final PhoneNumberController phoneNumberController = Get.put(PhoneNumberController());

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
                        phoneNumberController.getCurrentPhoneNumber() as String,
                        style: headText()
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextfieldWithHead(
                        hintText: "Enter new phone number",
                        textStyle: formFieldText(),
                        borderColor: defaultTextColor,
                        headText: "New Phone Number",
                        controllerFunction: phoneNumberController.phoneNumberController,
                        validator: phoneNumberController.validatePhoneNumber),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: PrimaryButton(onPressed: () {}, text: "Change"),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
