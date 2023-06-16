import 'package:flutter/material.dart';
import 'package:sahara/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:sahara/views/login_view.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({Key? key}) : super(key: key);
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
              count++;
            }
            if (count > 10) {
              Get.offAll(() => const LoginView(),
                  transition: Transition.fade,
                  duration: const Duration(seconds: 3));
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
