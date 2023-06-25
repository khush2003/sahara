import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sahara/models/user.dart';
import 'package:sahara/rest_api.dart';


class CustomTabController extends GetxController {
  static CustomTabController get instance => Get.find<CustomTabController>();
  final connect = Get.find<GetConnect>();
  final restApi = RestAPI.instance;
  final isGiveSelected = true.obs;
  final isReceiveSelected = false.obs;
  final isNewSelected = true.obs;
  final isHistorySelected = false.obs;

  Rx<UserSahara?> user = Rx<UserSahara?>(null);

  @override
  void onInit() {
    super.onInit();
    getUserById();
  }

  void getUserById() async {
    // UserSahara? fetchedUser = await FirebaseService()
    //     .getUserById(FirebaseAuth.instance.currentUser!.uid);
    // if (fetchedUser != null) {
    //   user.value = fetchedUser;
    //   print(user.value!.userName);
    // } else {
    //   print("User not found");
    // }
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
}
