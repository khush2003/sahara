import 'package:flutter/material.dart';
import '../../components/primary_button.dart';
import '../../theme/app_theme.dart';

import '../../components/textfield_description_head.dart';

class ChangeAddressView extends StatelessWidget {
  const ChangeAddressView({super.key});

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
                      "122/10 Wattnanakorn Sa-keao City 27160",
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
                      headText: "New Address"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: PrimaryButton(onPressed: () {}, text: "Change"),
                ),
              ],
            )),
      ),
    );
  }
}
