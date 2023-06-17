import 'package:flutter/material.dart';
import 'package:sahara/components/primary_button.dart';
import 'package:sahara/components/textfield_app.dart';
import 'package:sahara/theme/app_theme.dart';
import 'package:get/get.dart';
import '../../../../routes/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TestNote extends StatefulWidget {
  const TestNote({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<TestNote> {
  int _showPageOne = 0;

  bool isPageOne = false;
  bool isPageTwo = false;
  bool isPageThree = false;

  void _nextPage() {
    setState(() {
      if (_showPageOne < 2) {
        _showPageOne++;
      } else {
        Get.offAllNamed(Routes.login);
      }
    });
  }

  void _previousPage() {
    setState(() {
      if (_showPageOne == 0) {
      } else {
        _showPageOne--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: titleBackground,
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                  child: AspectRatio(
                    aspectRatio: 3,
                    child: Image.asset(
                      "assets/images/new_hd_logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: _showPageOne == 0
                            ? const PageOne()
                            : _showPageOne == 1
                                ? const PageTwo()
                                : const PageThree(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _previousPage();
                      },
                      child: const Icon(
                        FontAwesomeIcons.chevronLeft,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    Icon(
                      FontAwesomeIcons.solidCircle,
                      color: _showPageOne == 0 ? primary : Colors.white,
                      size: 20,
                    ),
                    Icon(
                      FontAwesomeIcons.solidCircle,
                      color: _showPageOne == 1 ? primary : Colors.white,
                      size: 20,
                    ),
                    Icon(
                      FontAwesomeIcons.solidCircle,
                      color: _showPageOne == 2 ? primary : Colors.white,
                      size: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        _nextPage();
                      },
                      child: const Icon(
                        FontAwesomeIcons.chevronRight,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Sahara is the application that let you donate unused items to people who have a need for them.",
          style: headText(color: const Color.fromARGB(255, 255, 255, 255)),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(child: Image.asset("assets/images/give.png")),
        )
      ],
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "In the other hands, you can be the receiver who’re looking for items in need.",
          style: headText(color: const Color.fromARGB(255, 255, 255, 255)),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(child: Image.asset("assets/images/receive.png")),
        )
      ],
    );
  }
}

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Now it’s time to transform your WASTE to be WISH for someone!",
          style: headText(color: const Color.fromARGB(255, 255, 255, 255)),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(child: Image.asset("assets/images/camel.png")),
        )
      ],
    );
  }
}
