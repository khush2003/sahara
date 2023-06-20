import 'package:flutter/material.dart';

import '../../components/primary_button.dart';
import '../../components/textfield_head.dart';
import '../../theme/app_theme.dart';

class ChangeUsernameView extends StatelessWidget {
  const ChangeUsernameView({super.key});

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
                      "Sample",
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
                      headText: "New Username"),
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
