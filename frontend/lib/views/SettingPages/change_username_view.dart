import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/controllers/change_settings/change_details_controller.dart';

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
        title: const Text("Change Username"),
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
                    child: Text(
                      changeController.user.value.userName,
                      style: headText()
                          .copyWith(decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextfieldWithHead(
                      hintText: "Enter new username",
                      textStyle: formFieldText(),
                      borderColor: defaultTextColor,
                      headText: "New Username",
                      controllerFunction: changeController.userNameController,),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: PrimaryButton(onPressed: () => changeController.changeNonAuthUserDetails(), text: "Change"),
                )
              ],
            )),
      ),
    );
  }
}
