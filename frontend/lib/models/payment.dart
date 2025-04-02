import 'package:sahara/utils/app_utils.dart';

class Payment {
  final String? paymentId;
  final String? paymentImageUrlSender, paymentImageUrlReceiver;
  final String senderId, receiverId;
  final DeliveryPaidBy deliveryPaidBy;
  Payment({
    this.paymentId,
    this.paymentImageUrlSender,
    this.paymentImageUrlReceiver,
    required this.senderId,
    required this.receiverId,
    required this.deliveryPaidBy,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      paymentId: json['paymentId'],
      paymentImageUrlSender: json['paymentImageUrlSender'],
      paymentImageUrlReceiver: json['paymentImageUrlReceiver'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      deliveryPaidBy: convertFromString(json['deliveryPaidBy']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'paymentImageUrlSender': paymentImageUrlSender,
      'paymentImageUrlReceiver': paymentImageUrlReceiver,
      'senderId': senderId,
      'receiverId': receiverId,
      'deliveryPaidBy': convertToString(deliveryPaidBy),
    };
  }

  factory Payment.empty() {
    return Payment(
      senderId: '',
      receiverId: '',
      deliveryPaidBy: DeliveryPaidBy.donor,
    );
  }

  // getbyid
  static Payment getFromId(String id, List<Payment> payments) {
    return payments.firstWhere((element) => element.paymentId == id);
  }
}
