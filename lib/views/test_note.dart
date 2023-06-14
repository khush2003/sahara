import 'package:flutter/material.dart';
import 'package:sahara/components/primary_button.dart';
import 'package:sahara/components/textfield_App.dart';
import 'package:sahara/theme/app_theme.dart';

class TestNote extends StatelessWidget {
  const TestNote({Key? key}) : super(key: key);
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
                    aspectRatio: 2.5,
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
                        "Login with",
                        style: titleText(
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: TextfieldAPP(
                          borderColor: const Color.fromARGB(255, 255, 255, 255),
                          textStyle: formFieldText(color: Colors.white),
                          hintText: "Email",
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
                              hintText: "Password",
                              secureText: true,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot Password?",
                                style: regularText(color: Colors.white)
                                    .copyWith(
                                        decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            PrimaryButton(text: "Login", onPressed: () {}),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Create an account!",
                                  style: regularText(color: Colors.white)
                                      .copyWith(
                                          decoration: TextDecoration.underline),
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Column(
                          children: [
                            Text("Or Login with",
                                style: headText(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255))),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Center(
                          child: Row(
                            children: [
                              Expanded(
                                  child: Image.asset(
                                "assets/images/GoogleIcon.png",
                                height: 70,
                                width: 70,
                              )),
                              Expanded(
                                  child: Image.asset(
                                "assets/images/FacebookIcon.png",
                                height: 70,
                                width: 70,
                              ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "What is Sahara?",
                  style: formFieldText(color: primary)
                      .copyWith(decoration: TextDecoration.underline),
                ),
              )),
        ],
      ),
    );
  }
}
