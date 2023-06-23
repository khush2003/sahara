import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/controllers/register_controller.dart';
import '../../components/primary_button.dart';
import '../../components/textfield_app.dart';
import '../../routes/routes.dart';
import '../../theme/app_theme.dart';



class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  final RegisterController registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: titleBackground,
      body: Stack(
        children: [
          Center(
            child: Form(
              autovalidateMode: AutovalidateMode.always,
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
                            controllerFunction: registerController.usernameController,
                            validator: registerController.validateUsername,
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
                                controllerFunction: registerController.emailController,
                                validator: registerController.validateEmail,
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
                                controllerFunction: registerController.passwordController,
                                validator: registerController.validateConfirmPassword,
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
                                    registerController.registerUser();
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
          ),
        ],
      ),
    );
  }
}
