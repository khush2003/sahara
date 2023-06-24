


import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sahara/controllers/auth/auth_controller.dart';
import 'package:sahara/rest_api.dart';

class PhoneNumberController extends GetxController{
  final restApi = RestAPI.instance;
  static PhoneNumberController get instance => Get.find();
  final _auth = AuthController.instance;
  final TextEditingController phoneNumberController = TextEditingController();


  Future<void>? updateUserPhoneNumber() async {
    final phoneNumber = phoneNumberController.text;

    String? error = await _auth.updateUserPhoneNumber(phoneNumber);

  }
  
  
}