import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sahara/controllers/auth/auth_controller.dart';
import 'package:sahara/models/user.dart';
import 'package:sahara/rest_api.dart';
import 'package:sahara/theme/app_theme.dart';
import 'package:sahara/utils/app_utils.dart';

class PhoneNumberController extends GetxController {
  final restApi = RestAPI.instance;
  static PhoneNumberController get instance => Get.find();
  final _auth = AuthController.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController phoneNumberController = TextEditingController();
  final AuthController donationDetailsController = Get.put(AuthController());

  Future<void>? updateUserPhoneNumber() async {
    final phoneNumber = phoneNumberController.text;
    if (validateInputs()) {
      String? error = await _auth.updateUserPhoneNumber(phoneNumber);
      if (error != null) {
        errorSnackBar(error.toString());
      }
    } else {
      errorSnackBar('Please fill the phoneNumber field correctly.');
    }
  }

  Future<String?> getCurrentPhoneNumber() async {
    try {
      // Get the current user info
      final UserSahara currentUser = await restApi.getCurrentUserInfo();

      print("User phone number: $currentUser");

      return currentUser.userPhoneNumber;
    } catch (error) {
      print(error);
      return null;
    }
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phonenumber';
    } else if (value.length > 20) {
      return 'First name cannot be longer than 20 characters';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Phone number should contain only numbers';
    }
    return null;
  }

  bool validateInputs() {
    String? phoneNumberError = validatePhoneNumber(phoneNumberController.text);

    if (phoneNumberController.text.isEmpty || phoneNumberError != null) {
      return false;
    }

    return true;
  }

  Widget buildPhoneNumberWidget() {
    return FutureBuilder<String?>(
      future: getCurrentPhoneNumber(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data!,
            style: headText().copyWith(
              decoration: TextDecoration.underline,
            ),
          );
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }
}