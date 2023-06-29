import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/controllers/counpon_controller.dart';
import 'package:sahara/theme/app_theme.dart';

import '../components/coupon_card.dart';

class CouponView extends StatelessWidget {
  CouponView({super.key});
  final CouponController couponController = Get.put(CouponController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Discount Coupon"),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Obx(() {
            if (couponController.couponList.isEmpty) {
              return Center(
                child: Text(
                  "No Coupon Found",
                  style: headTextBold(),
                ),
              );
            }
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return CouponCard(
                    couponImage: couponController.couponList[index].couponImage,
                    couponName: couponController.couponList[index].couponName,
                    discountCode:
                        couponController.couponList[index].discountCode,
                    discountPrice:
                        couponController.couponList[index].discountPrice,
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemCount: couponController.couponList.length,
              ),
            );
          }),
        ),
      ),
    );
  }
}
