import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/controllers/counpon_controller.dart';
import 'package:sahara/theme/app_theme.dart';

import '../components/coupon_card.dart';

class CouponView extends StatelessWidget {
  CouponView({super.key});
  final couponController = CouponController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Discount Coupon"),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: TabBarView(children: [
              Obx(() {
                if (couponController.couponList.isEmpty) {
                  return Center(
                      child: Text("No Reviews Found", style: headTextBold()));
                }
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return CouponCard(
                        couponImage:
                            couponController.couponList[index].couponImage,
                        couponName:
                            couponController.couponList[index].couponName,
                        discountCode:
                            couponController.couponList[index].discountCode,
                        discountPrice:
                            couponController.couponList[index].discountPrice,
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: couponController.couponList.length);
              })
            ])),
      ),
    );
  }
}

// Padding(
//                   padding: EdgeInsets.only(top: 20),
//                   child: CouponCard(
//                       couponName: "Suki Tee Noi",
//                       couponImage: "assets/images/teenoiLogo.png",
//                       discountPrice: 100,
//                       discountCode: "712-8B1-XZ0-87A"),
//                 ),
