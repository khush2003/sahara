import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/controllers/change_settings/change_details_controller.dart';
import '../../components/primary_button.dart';
import '../../theme/app_theme.dart';

import '../../components/textfield_description_head.dart';

class ChangeAddressView extends StatelessWidget {
  ChangeAddressView({super.key});
  final changeController = Get.put(ChangeUserDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Address"),
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
                      "Your current address :",
                      style: headTextBold(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      changeController.user.value.userAddress!.trim() == ''
                          ? "No address"
                          : changeController.user.value.userAddress ??
                              "No address",
                      style: regularTextBold()
                          .copyWith(decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextfieldDescriptionWithHead(
                      hintText: "Enter new address",
                      textStyle: regularTextBold(),
                      borderColor: defaultTextColor,
                      controllerFunction:
                          changeController.userAddressController,
                      headText: "New Address"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: PrimaryButton(
                      onPressed: () =>
                          changeController.changeNonAuthUserDetails(),
                      text: "Change"),
                ),
              ],
            )),
      ),
    );
  }
}
