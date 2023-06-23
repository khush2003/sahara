import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/models/user.dart';

import '../rest_api.dart';
import '../routes/routes.dart';
import '../utils/app_utils.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final restApi = RestAPI.instance;

  //Not finished YET!! Don't change anything!!!!

    void sendDataToFirestore(String username) async {
    dynamic result = await restApi.postUserInfo(UserSahara(userName: username));
    if (result != null) {
      // Success, handle the response data
      print('Data sent successfully: $result');
    } else {
      // Error, handle the failure
      print('Failed to send data');
    }
  }

  Future<String?> createUser(
      String email, String password, UserSahara user) async {
        print("Create user Activated");
    try {
      // Authenticate user (Create account)
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final confirmedUser = UserSahara(
          uid: _auth.currentUser!.uid,
          userName: user.userName,
          userPhoneNumber: '',
          userAddress: '',
          profilePicture: '',
          blockedUser: [],
          discountCoupon: [],
          userOwnPost: [],
          userReviewPost: []);
      Get.offAllNamed(Routes.app);
      dynamic result = await restApi.postUserInfo(confirmedUser);
      sucessSnackBar("Account Created Sucessfully!");
    } on FirebaseAuthException catch (e) {
      return getAuthErrorMessage(e.code);
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
    return null;
  }

   Future<String?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed(Routes.feed);
      sucessSnackBar("Login Sucess!");
    } on FirebaseAuthException catch (e) {
      return getAuthErrorMessage(e.code);
    } catch (_) {
      return "There was an unexpected error! Please try again later";
    }
    return null;
  }
}
