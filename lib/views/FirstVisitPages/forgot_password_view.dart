import 'package:flutter/material.dart';
import 'package:sahara/components/primary_button.dart';
import 'package:sahara/components/textfield_Head.dart';
import 'package:sahara/components/textfield_app.dart';
import 'package:sahara/theme/app_theme.dart';
import 'package:get/get.dart';
import '../../../../../routes/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotPassView extends StatefulWidget {
  const ForgotPassView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ForgotPassView createState() => _ForgotPassView();
}

class _ForgotPassView extends State<ForgotPassView> {
  bool isSent = false;
  void _changeTextFromSent() {
    setState(() {
      isSent = true;
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
                      Text(
                        "Forgot Password",
                        style: titleText(
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: TextfieldWithHead(
                            hintText: "Enter your email",
                            textStyle: formFieldText(color: Colors.white),
                            borderColor: lonely,
                            headText: "Email"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                            "Please enter your email that've been registered to this application",
                            style: regularText(color: Colors.white)),
                      ),
                      if (isSent)
                        Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                                "We sent the password reset mail to your email inbox! Please check it. This may took a while",
                                style: regularText(color: sucess)))
                      else
                        Container(),
                      Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: PrimaryButton(
                              onPressed: () {
                                if (isSent) {
                                  Get.offAllNamed(Routes.login);
                                } else {
                                  _changeTextFromSent();
                                }
                              },
                              text: isSent
                                  ? "Go back to Login page"
                                  : "Password Reset")),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Center(
                          child: Row(
                            children: [
                              Expanded(
                                  child: Image.asset(
                                "assets/images/GoogleIcon.png",
                                height: 50,
                                width: 50,
                              )),
                              Expanded(
                                  child: Image.asset(
                                "assets/images/FacebookIcon.png",
                                height: 50,
                                width: 50,
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
              alignment: Alignment.topLeft,
              child: GestureDetector(
                  onTap: () {
                    Get.offAllNamed(Routes.login);
                  },
                  child: const Icon(FontAwesomeIcons.arrowLeft))),
        ],
      ),
    );
  }
}
