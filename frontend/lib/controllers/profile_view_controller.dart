import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:sahara/models/user.dart';
import 'package:sahara/rest_api.dart';

import '../services/firebase_firestore_service.dart';

class CustomTabController extends GetxController {
  FirebaseService firebaseService = FirebaseService();
  final connect = Get.find<GetConnect>();
  final restApi = RestAPI.instance;
  final isGiveSelected = true.obs;
  final isReceiveSelected = false.obs;
  final isNewSelected = true.obs;
  final isHistorySelected = false.obs;

  UserSahara? user;

  // @override
  // void onInit() {
  //   super.onInit();
  //   getUserById('t2W6MkNYcs63irPKBwdb');
  //   print(user);
  // }
  @override
  void onInit() {
    super.onInit();
    getUserById('cZIHOdL8GxrleOT9uUYL');
    // ever(user, (UserSahara? user) {
    //   if (user != null) {
    //     print(user.userName);
    //   }
    // });
  }

  void selectNew() {
    isNewSelected.value = true;
    isHistorySelected.value = false;
  }

  void selectHistory() {
    isHistorySelected.value = true;
    isNewSelected.value = false;
  }

  void selectGive() {
    isGiveSelected.value = true;
    isReceiveSelected.value = false;
  }

  void selectReceive() {
    isGiveSelected.value = false;
    isReceiveSelected.value = true;
  }

  // void getUserById(String userId) async {
  //   UserSahara? fetchedUser = await firebaseService.getUserById(userId);
  //   if (fetchedUser != null) {
  //     user = fetchedUser;
  //     print(user!.userPhoneNumber);
  //   } else {
  //     print("User not found");
  //   }
  // }
  Future<UserSahara?> getUserById(String userId) async {
    UserSahara? fetchedUser = await firebaseService.getUserById(userId);
    if (fetchedUser != null) {
      user = fetchedUser;
      print(user!.userPhoneNumber);
    } else {
      print("User not found");
    }
    return fetchedUser;
  }
}
