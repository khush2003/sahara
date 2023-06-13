import 'package:flutter/material.dart';
import 'package:sahara/components/primaryButton.dart';
import 'package:sahara/components/textfield.dart';

class TestNote extends StatelessWidget {
  const TestNote({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: Column(
        children: [
          PrimaryButton(
            onPressed: () {},
            text: "POST REVIEW",
          ),
        ],
      )),
    ));
  }
}
