import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/controllers/auth/login_controller.dart';
import '../../components/primary_button.dart';
import '../../components/textfield_app.dart';
import '../../routes/routes.dart';
import '../../theme/app_theme.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final LogInController logInController = Get.put(LogInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: titleBackground,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 3,
                child: Image.asset(
                  "assets/images/new_hd_logo.png",
                  fit: BoxFit.contain,
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
                        controllerFunction: logInController.emailController,
                        validator: logInController.validateEmail,
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
                            controllerFunction:
                                logInController.passwordController,
                            validator: logInController.validatePassword,
                            secureText: true,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              onPressed: () {
                                Get.offAllNamed(Routes.forgotPass);
                              },
                              child: Text(
                                "Forgot Password?",
                                style: regularText(color: Colors.white)
                                    .copyWith(
                                        decoration: TextDecoration.underline),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          PrimaryButton(
                            text: "Login",
                            onPressed: logInController.loginUser,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                                onPressed: () {
                                  Get.offAllNamed(Routes.register);
                                },
                                child: Text(
                                  "Create an account!",
                                  style: regularText(color: Colors.white)
                                      .copyWith(
                                          decoration: TextDecoration.underline),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: () {
                        Get.offAllNamed(Routes.whatIs);
                      },
                      child: Text(
                        "What is Sahara?",
                        style: formFieldText(color: primary)
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
