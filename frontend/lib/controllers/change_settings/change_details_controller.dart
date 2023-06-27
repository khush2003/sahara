import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/controllers/auth/auth_controller.dart';
import 'package:sahara/rest_api.dart';
import 'package:sahara/utils/app_utils.dart';

import '../../models/user.dart';

class ChangeUserDetailsController extends GetxController {
  final _auth = AuthController.instance;
  final user = UserSahara.empty().obs;
  final _restAPI = RestAPI.instance;
  @override
  void onInit() {
    user(_auth.userSahara.value);
    super.onInit();
  }

  final userNameController = TextEditingController();
  final userPhoneNumberController = TextEditingController();
  final userAddressController = TextEditingController();
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void changeNonAuthUserDetails() async {
    final newUser = UserSahara(
      userName: userNameController.text.trim() == ''
          ? user.value.userName
          : userNameController.text.trim(),
      userPhoneNumber: userPhoneNumberController.text.trim() == ''
          ? user.value.userPhoneNumber
          : userPhoneNumberController.text.trim(),
      userAddress: userAddressController.text.trim() == ''
          ? user.value.userAddress
          : userAddressController.text.trim(),
    );
    await _restAPI.putUserInfo(newUser);
    Get.back();
    successSnackBar('User details changed successfully');
    _auth.updateUser();
  }

  void changeUserPassword() async {
    if (newPasswordController.text.trim() ==
        confirmPasswordController.text.trim()) {
      try {
        if (currentPasswordController.text.trim() != '') {
          await FirebaseAuth.instance.currentUser!.reauthenticateWithCredential(
            EmailAuthProvider.credential(
              email: _auth.firebaseUser.value!.email!,
              password: currentPasswordController.text.trim(),
            ),
          );
          if (newPasswordController.text.trim().length < 8) {
            errorSnackBar('Password must be at least 8 characters long');
          } else {
            FirebaseAuth.instance.currentUser!
                .updatePassword(newPasswordController.text.trim());
            Get.back();
            successSnackBar('Password changed successfully');
          }
        }
      } on FirebaseAuthException catch (e) {
        errorSnackBar(getAuthErrorMessage(e.code));
      }
    } else {
      errorSnackBar('New password and confirm password does not match');
    }
  }
}
