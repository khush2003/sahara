import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:sahara/controllers/auth/auth_controller.dart';
import 'package:sahara/models/coupon.dart';

import 'package:sahara/rest_api.dart';
import 'package:sahara/utils/app_utils.dart';

class CouponController extends GetxController {
  final auth = FirebaseAuth.instance;
  final RxList<Coupon> couponList = <Coupon>[].obs;

  static CouponController get instance => Get.find<CouponController>();

  final restAPI = RestAPI.instance;

  List<String>? userCoupons;

  @override
  void onInit() async {
    await setupCouponList();
    super.onInit();
  }

  Future<void>? updateCoupon() async {
    try {
      await restAPI.postCoupon();
    } catch (e) {
      errorSnackBar(e.toString());
    }
  }

  Future<void>? setupCouponList() async {
    final uid = auth.currentUser!.uid;
    try {
      List<Coupon>? userCoupons = await restAPI.getUserCoupons(uid);
      couponList(userCoupons);
    } catch (e) {
      errorSnackBar(e.toString());
    }
  }

  Future<void>? copytoClipBoard(String text) async {
    try {
      await Clipboard.setData(ClipboardData(text: text));
      normalSnackBar("COPIED!", "Copied discount code to your clipboard!",
          Colors.white, Colors.black);
    } catch (e) {
      errorSnackBar(e.toString());
    }
  }
}
