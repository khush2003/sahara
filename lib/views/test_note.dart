import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sahara/components/primary_button.dart';
import 'package:sahara/components/textfield_App.dart';
import 'package:sahara/theme/app_theme.dart';
import 'package:sahara/utils/uni_icon.dart';
import 'package:unicons/unicons.dart';

class TestNote extends StatelessWidget {
  const TestNote({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 310, 0, 0),
                  child: Center(
                    child: PrimaryButton(
                      text: "POST REVIEW",
                      onPressed: () {},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: TextfieldAPP(
                    hintText: "input this or that",
                    textStyle: formFieldText(color: lonely),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: "Go home Bye Bye", style: regularText()),
                      const WidgetSpan(
                        child: Icon(
                          FontAwesomeIcons.bahtSign,
                          size: 17,
                        ),
                      ),
                      TextSpan(text: "1000", style: regularText()),
                      TextSpan(
                          text: "\nWOW testing\nHow are yoiil?",
                          style: titleText(height: 0.6)),
                      WidgetSpan(
                        child: bahtIconRegularText(),
                      ),
                      TextSpan(text: "1000", style: titleText(height: 0.6)),
                    ],
                  ),
                ),
                const Icon(
                  FontAwesomeIcons.solidBell,
                  size: 18,
                ),
                const Icon(
                  FontAwesomeIcons.atlassian,
                  size: 18,
                ),
              ]),
            ))));
  }
}
