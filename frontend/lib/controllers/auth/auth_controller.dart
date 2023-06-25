import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/models/user.dart';

import '../../rest_api.dart';
import '../../routes/routes.dart';
import '../../utils/app_utils.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final restApi = RestAPI.instance;

  Future<String?> createUser(
      String email, String password, UserSahara user) async {
    print("Create user Activated");
    try {
      // Authenticate user (Create account)
      final userData = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final confirmedUser = UserSahara(
          userName: user.userName,
          userPhoneNumber: '',
          userAddress: '',
          profilePicture: '',
          coverPicture: '',
          blockedUser: [],
          discountCoupon: [],
          userOwnPost: [],
          userReviewPost: []);
      Get.offAllNamed(Routes.app);
      await restApi.postUserInfo(confirmedUser, userData.user!.uid);
      successSnackBar("Account Created Sucessfully!");
    } on FirebaseAuthException catch (e) {
      return getAuthErrorMessage(e.code);
    } catch (e) {
      return ("There was an unexpected error occurred, Please try again later");
    }
    return null;
  }

  Future<String?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed(Routes.app);
      successSnackBar("Login Sucess!");
    } on FirebaseAuthException catch (e) {
      return getAuthErrorMessage(e.code);
    } catch (_) {
      return "There was an unexpected error occurred, Please try again later";
    }
    return null;
  }

  Future<String?> updateUserPhoneNumber(String userPhoneNumber) async {
    try {
      //Get the current user id
      final UserSahara currentUser = await restApi.getCurrentUserInfo();

      // Update the phone number in the user data
      final updatedUser = UserSahara(
        userName: currentUser.userName,
        userPhoneNumber: userPhoneNumber,
        profilePicture: currentUser.profilePicture,
        coverPicture: currentUser.coverPicture,
        userAddress: currentUser.userAddress,
        blockedUser: currentUser.blockedUser,
        discountCoupon: currentUser.discountCoupon,
        userOwnPost: currentUser.userOwnPost,
        userReviewPost: currentUser.userReviewPost,
        token: currentUser.token,
      );

      final result = await restApi.putUserInfo(updatedUser);

      if (result != null) {
        // Handle success scenario
        return 'Phone number updated successfully';
      } else {
        // Handle error scenario
        return 'Failed to update phone number';
      }
    } catch (e) {
      // Handle exception/error
      print(e);
      return 'An error occurred. Please try again later';
    }
  }
}
