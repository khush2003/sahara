import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sahara/components/primary_button.dart';
import 'package:sahara/components/textfield_App.dart';
import 'package:sahara/components/textfield_Head.dart';
import 'package:sahara/theme/app_theme.dart';
import 'package:sahara/utils/uni_icon.dart';
import 'package:unicons/unicons.dart';

class TestNote extends StatelessWidget {
  const TestNote({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Text(
      "Welcome to",
      style: titleText(),
    ));
  }
}
