import 'package:flutter/material.dart';
import 'package:sahara/components/primary_button.dart';
import 'package:sahara/components/textfield_App.dart';
import 'package:sahara/theme/app_theme.dart';
import 'package:get/get.dart';
import '../../../../routes/routes.dart';

class TestNote extends StatelessWidget {
  TestNote({Key? key}) : super(key: key);
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: titleBackground,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/boardingPageTemplate.png"),
          fit: BoxFit.cover,
        )),
        child: GestureDetector(
          onVerticalDragUpdate: (details) {
            if (details.delta.dy < 0) {
              print(count);
              count++;
            }
            if (count > 500) {
              Get.offAllNamed(Routes.login);
            }
          },
          onVerticalDragEnd: (details) {
            count = 0;
          },
        ),
      ),
    );
  }
}
