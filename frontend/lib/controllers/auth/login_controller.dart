



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/controllers/auth/auth_controller.dart';
import 'package:sahara/utils/app_utils.dart';

class LogInController extends GetxController {
  final isvisible = false.obs;

  bool buttonclicked = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _auth = AuthController.instance;
  void toogleVisible() {
    isvisible(!isvisible.value);
  }

  Future<void> loginUser() async {
    bool vaildEmail = checkEmail(emailController.text.trim());
    if (vaildEmail) {
      if (passwordController.text != "") {
        final email = (emailController.text.trim());
        final password = passwordController.text;
        String? error = await _auth.loginWithEmailAndPassword(email, password);
        if (error != null) {
          errorSnackBar(error.toString());
        }
      } else {
        errorSnackBar("Please enter a passsword!");
      }
    } else {
      errorSnackBar(
          "Please enter a vaild Email!");
    }
  }
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return checkEmail(emailController.text.trim())
        ? null
        : "Please enter a vaild email";
  }
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  isButtonClicked() {
    if (buttonclicked == true) {
      return true;
    } else {
      return false;
    }
  }
}