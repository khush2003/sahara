import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'package:sahara/controllers/auth/auth_controller.dart';

import 'package:sahara/rest_api.dart';
import 'package:sahara/utils/app_utils.dart';

class CouponController extends GetxController {
  final auth = FirebaseAuth.instance;

  static CouponController get instance => Get.find<CouponController>();

  final restAPI = RestAPI.instance;

  Future<void>? updateCoupon() async {
    String? error = await restAPI.postCoupon();
    if (error != null) {
          errorSnackBar(error.toString());
        }
  }
}
