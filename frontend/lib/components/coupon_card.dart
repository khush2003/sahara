import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sahara/controllers/counpon_controller.dart';

import '../theme/app_theme.dart';

class CouponCard extends StatelessWidget {
  final String couponName;
  final String couponImage;
  final int discountPrice;
  final String discountCode;
  const CouponCard(
      {super.key,
      required this.couponName,
      required this.couponImage,
      required this.discountPrice,
      required this.discountCode});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showCouponDialog(
          context, couponName, couponImage, discountPrice, discountCode),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: secondary,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                  child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Image.network(couponImage, fit: BoxFit.fill)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        couponName,
                        style: regularTextBold(height: 0.5),
                      ),
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(text: "- ", style: regularText(height: 1)),
                      TextSpan(text: "Discount", style: regularText(height: 1)),
                      WidgetSpan(child: bahtIconRegularText(size: 15)),
                      TextSpan(
                          text: discountPrice.toString(),
                          style: regularTextBold(height: 1)),
                    ])),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 10),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "Click to use",
                  style: regularTextBold(height: 0.5)
                      .copyWith(decoration: TextDecoration.underline),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void _showCouponDialog(BuildContext context, String couponName,
    String couponImage, int discountPrice, String discountCode) {
  final CouponController couponController = Get.put(CouponController());
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 200),
          child: Stack(children: [
            Column(
              children: [
                SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(couponImage, fit: BoxFit.fill)),
                Padding(
                  padding: const EdgeInsets.only(top: 13),
                  child: Text(
                    couponName,
                    style: titleText().copyWith(height: 0.5),
                  ),
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(text: "- ", style: headTextBold(height: 1)),
                  TextSpan(text: "Discount", style: headTextBold(height: 1)),
                  WidgetSpan(child: bahtIconRegularText(size: 20)),
                  TextSpan(
                      text: discountPrice.toString(),
                      style: headText(height: 1)),
                ])),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "CODE",
                    style: regularTextBold(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          discountCode,
                          style: regularText(),
                        ),
                        GestureDetector(
                          child: const Icon(FontAwesomeIcons.copy),
                          onTap: () {
                            couponController.copytoClipBoard(discountCode);
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(FontAwesomeIcons.squareXmark)))
          ]),
        ),
      ),
    ),
  );
}
