import 'dart:convert';

class Coupon {
  final String couponName;
  final String couponImage;
  final String discountPrice;
  final String discountCode;

  Coupon({
    required this.couponName,
    required this.couponImage,
    required this.discountPrice,
    required this.discountCode,
  });

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  factory Coupon.fromjson(Map<String, dynamic> json) {
    return Coupon(
      couponName: json['couponName'] ?? '',
      couponImage: json['couponImage'] ?? '',
      discountPrice: json['discountPrice'] ?? '',
      discountCode: json['discountCode'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'couponName': couponName,
      'couponImage': couponImage,
      'discountPrice': discountPrice,
      'discountCode': discountCode,
    };
  }

}
