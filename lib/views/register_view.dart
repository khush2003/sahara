import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sahara/components/primary_button.dart';
import 'package:sahara/components/textfield_app.dart';
import 'package:sahara/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:sahara/views/login_view.dart';
import '../../../../routes/routes.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);
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
                      Text(
                        "Create Account",
                        style: titleText(
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: TextfieldAPP(
                          borderColor: const Color.fromARGB(255, 255, 255, 255),
                          textStyle: formFieldText(color: Colors.white),
                          hintText: "Enter your username",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextfieldAPP(
                              borderColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              textStyle: formFieldText(color: Colors.white),
                              hintText: "Enter your email",
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextfieldAPP(
                              borderColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              textStyle: formFieldText(color: Colors.white),
                              hintText: "Enter your password",
                              secureText: true,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextfieldAPP(
                              borderColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              textStyle: formFieldText(color: Colors.white),
                              hintText: "Confirm your password",
                              secureText: true,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Column(
                          children: [
                            PrimaryButton(text: "Register", onPressed: () {}),
                            TextButton(
                                onPressed: () {
                                  Get.offAllNamed(Routes.login);
                                },
                                child: Text(
                                  "Go back to Login page",
                                  style: regularText(color: Colors.white)
                                      .copyWith(
                                          decoration: TextDecoration.underline),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
