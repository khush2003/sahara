import 'dart:convert';

import '../utils/app_utils.dart';
import 'author.dart';

class DonationItem {
  final String? donationId;
  final String name, description, imageUrl, category;
  final double itemWidth, itemLength, itemHeight, weight;
  final DeliveryPaidBy deliveryPaidBy;
  final Duration usedDuration;
  final double usability, price, deliveryFees;
  final List<String> tags;
  final Author author;
  final bool isOverPriced;
  final double estimatedItemValue;
  final DateTime? expectedArrivalDate, pickUpDate;
  final DeliveryStatus deliveryStatus;
  final String? receiverId;

  DonationItem({
    this.donationId,
    this.receiverId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.itemWidth,
    required this.itemLength,
    required this.itemHeight,
    required this.weight,
    required this.deliveryPaidBy,
    required this.usedDuration,
    required this.usability,
    required this.price,
    required this.deliveryFees,
    required this.tags,
    required this.author,
    this.expectedArrivalDate,
    this.pickUpDate,
    this.deliveryStatus = DeliveryStatus.toDeliver,
  })  : estimatedItemValue = price * usability,
        isOverPriced = deliveryFees > price * usability;

  factory DonationItem.test() {
    return DonationItem(
        donationId: '12',
        name: 'James',
        description:
            'I am thrilled to announce a special giveaway of a premium water bottle that is practically brand new! This sleek and stylish hydration company.This sleek and stylish hydration company ',
        imageUrl:
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
        category: 'Refrigerator',
        itemWidth: 20,
        itemLength: 10,
        itemHeight: 50,
        weight: 120,
        deliveryPaidBy: DeliveryPaidBy.donor,
        usedDuration: const Duration(days: 14),
        usability: 0.80,
        price: 5000,
        deliveryFees: 5000,
        tags: ['fridge', 'giveaway'],
        author: Author(
            authorId: '12',
            name: 'James',
            imageUrl:
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'));
  }
  factory DonationItem.fromJson(Map<String, dynamic> json) {
    return DonationItem(
        donationId: json['donationId'],
        name: json['name'] ?? '',
        description: json['description'] ?? '',
        imageUrl: json['imageUrl'] ?? '',
        category: json['category'] ?? '',
        itemWidth: convertToDouble(json['itemWidth']),
        itemLength: convertToDouble(json['itemLength']),
        itemHeight: convertToDouble(json['itemHeight']),
        weight: convertToDouble(json['weight']),
        deliveryPaidBy: convertFromString(json['deliveryPaidBy']),
        usedDuration: Duration(days: json['usedDuration'] as int),
        usability: convertToDouble(json['usability']),
        price: convertToDouble(json['price']),
        deliveryFees: convertToDouble(json['deliveryFees']),
        expectedArrivalDate: json['expectedArrivalDate'] == null
            ? null
            : DateTime.parse(json['expectedArrivalDate'] as String),
        pickUpDate: json['pickUpDate'] == null
            ? null
            : DateTime.parse(json['pickUpDate'] as String),
        deliveryStatus: json['deliveryStatus'] == null
            ? DeliveryStatus.inTransit
            : convertDeliveryStatusFromString(json['deliveryStatus']),
        tags: json['tags'] == null
            ? []
            : List<String>.from(json['tags'] as List<dynamic>),
        receiverId: json['receiverId'],
        author: Author.fromJson(json));
  }
  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'category': category,
      'usedDuration': usedDuration.inDays,
      'usability': usability,
      'price': price,
      'estimatedItemValue': estimatedItemValue,
      'itemWidth': itemWidth,
      'itemLength': itemLength,
      'itemHeight': itemHeight,
      'weight': weight,
      'deliveryFees': deliveryFees,
      'deliveryPaidBy': convertToString(deliveryPaidBy),
      'description': description,
      'tags': tags,
      'expectedArrivalDate': expectedArrivalDate?.toIso8601String(),
      'pickUpDate': pickUpDate?.toIso8601String(),
      'deliveryStatus': convertDeliveryStatusToString(deliveryStatus),
      'receiverId': receiverId,
      'authorName': author.name,
      'authorImageURL': author.imageUrl,
      'authorId': author.authorId,
    };
  }

  factory DonationItem.getFromId(String donationId, List<DonationItem> list) {
    return list.firstWhere((element) => element.donationId == donationId);
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}

// Write a function to check if value is int or double, if the value is int convert to double
// and return the value
// if the value is double return the value
double convertToDouble(dynamic value) {
  if (value is int) {
    return value.toDouble();
  } else if (value is double) {
    return value;
  } else {
    throw Exception('Value is not int or double');
  }
}
