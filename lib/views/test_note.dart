import 'package:flutter/material.dart';
import 'package:sahara/components/textfield.dart';

class TestNote extends StatelessWidget {
  const TestNote({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Textfield(
          hintText: "Enter that",
          fontWeight: FontWeight.w300,
          fontsize: 32,
          pretext: "test",
        )
      ]),
    ));
  }
}
