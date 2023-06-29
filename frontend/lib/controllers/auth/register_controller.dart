import 'package:flutter/material.dart';
import 'package:sahara/models/user.dart';
import 'package:get/get.dart';
import 'package:sahara/rest_api.dart';

import '../../utils/app_utils.dart';
import 'auth_controller.dart';

class RegisterController extends GetxController {
  late UserSahara user;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final RestAPI restAPI = RestAPI.instance;

  final _auth = AuthController.instance;

  Future<void>? registerUser() async {
    String username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    if (validateInputs()) {
        String? error = await _auth.createUser(email, password, username);
        if (error != null) {
          errorSnackBar(error.toString());
        }
    } else {
      errorSnackBar(
          'Please fill in all the fields correctly to create an account.');
    }
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your first name';
    } else if (value.length > 40) {
      return 'User\'s name cannot be longer than 40 characters';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return checkEmail(emailController.text)
        ? null
        : "Please enter a vaild email";
  }

  bool validateInputs() {
    String? usernameNameError = validateUsername(usernameController.text);
    String? emailError = validateEmail(emailController.text);
    String? passwordError = validatePassword(passwordController.text);
    String? confirmPasswordError =
        validateConfirmPassword(confirmPasswordController.text);

    if (usernameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty ||
        usernameNameError != null ||
        emailError != null ||
        passwordError != null ||
        confirmPasswordError != null) {
      return false;
    }

    return true;
  }
}
