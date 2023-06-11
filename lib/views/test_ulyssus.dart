import 'package:flutter/material.dart';

class TestUlyssus extends StatelessWidget {
  const TestUlyssus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Hello Ulyssus")),
        body: const Center(
          child: Text("Please don't test me."),
        ));
  }
}
