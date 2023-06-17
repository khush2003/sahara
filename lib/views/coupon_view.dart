import 'package:flutter/material.dart';
import 'package:sahara/components/primary_button.dart';
import 'package:sahara/components/textfield_Head.dart';
import 'package:sahara/theme/app_theme.dart';

import '../components/coupon_card.dart';

class TestNote extends StatelessWidget {
  const TestNote({super.key});

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
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: CouponCard(
                      couponName: "Suki Tee Noi",
                      couponImage: "assets/images/teenoiLogo.png",
                      discountPrice: 100,
                      discountCode: "712-8B1-XZ0-87A"),
                ),
              ],
            )),
      ),
    );
  }
}
