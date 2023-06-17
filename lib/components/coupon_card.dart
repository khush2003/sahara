import 'package:flutter/material.dart';
import 'package:sahara/components/primary_button.dart';
import 'package:sahara/components/textfield_App.dart';
import 'package:sahara/components/textfield_Head.dart';
import 'package:sahara/theme/app_theme.dart';
import 'package:get/get.dart';
import '../../../../routes/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
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
                      child: Image.asset(couponImage, fit: BoxFit.fill)),
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
              padding: const EdgeInsets.only(right: 5),
              child: Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Click to use",
                    style: regularTextBold(height: 0.5)
                        .copyWith(decoration: TextDecoration.underline),
                  ),
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
                    child: Image.asset(couponImage, fit: BoxFit.fill)),
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
                        const Icon(FontAwesomeIcons.copy)
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