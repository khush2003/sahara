import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/routes/routes.dart';
import '../../theme/app_theme.dart';


class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  OnBoardingState createState() => OnBoardingState();
}

class OnBoardingState extends State<OnBoardingView> {
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
            fit: BoxFit.fill,
          ),
        ),
        child: GestureDetector(
          onVerticalDragUpdate: (details) {
            if (details.delta.dy < 0) {
              count++;
            }
            if (count > 10) {
              Get.offAllNamed(
                Routes.login,
              );
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
