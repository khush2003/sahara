import 'package:flutter/material.dart';
import 'package:sahara/components/primary_button.dart';
import 'package:sahara/components/textfield.dart';

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
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 310, 0, 0),
                child: Center(
                  child: Text("TRANSFORM\nWASTE\nINTO\nWISH",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Dongle',
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 36,
                          height: 1,
                          fontWeight: FontWeight.w400)),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
