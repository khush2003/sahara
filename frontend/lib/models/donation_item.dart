import 'dart:convert';

import '../utils/app_utils.dart';
import 'author.dart';

class DonationItem {
  final String donationId;
  final String name, description, imageUrl, category;
  final double itemWidth, itemLength, itemHeight, weight;
  final String deliveryPaidBy;
  final int usedDuration;
  final String usedDurationType;
  final Duration usedDurationTotal;
  final double usability, price, deliveryFees;
  final List<String> tags;
  final Author author;
  final bool isOverPriced;
  final double estimatedItemValue;

  DonationItem({
    this.donationId = '',
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
    required this.usedDurationType,
    this.usedDurationTotal = const Duration(days: 0),
    required this.usability,
    required this.price,
    required this.estimatedItemValue,
    required this.deliveryFees,
    required this.tags,
    required this.author,
  }) : //estimatedItemValue = price * useability,
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
        deliveryPaidBy: 'Donor (you)',
        usedDuration: 2,
        usedDurationType: 'Week',
        usedDurationTotal: const Duration(days: 14),
        usability: 0.80,
        price: 5000,
        estimatedItemValue: 4000,
        deliveryFees: 5000,
        tags: ['fridge', 'giveaway'],
        author: Author(
            authorId: '12',
            name: 'James',
            imageUrl:
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'));
  }
  factory DonationItem.fromJson(Map<String, dynamic> json, String documentId) {
    return DonationItem(
      donationId: documentId,
      name: json['name'] ?? '',
      description: json['description '] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      category: json['category'] ?? '',
      itemWidth: json['itemWidth'] as double,
      itemLength: json['itemLength'] as double,
      itemHeight: json['itemHeight'] as double,
      weight: json['weight'] as double,
      deliveryPaidBy: json['deliveryPaidBy'] ?? '',
      usedDuration: json['usedDuration'] as int,
      usedDurationType: json['usedDurationType'] ?? '',
      usedDurationTotal: Duration(days: json['usedDurationTotal']),
      usability: json['useability'] as double,
      price: json['price'] as double,
      estimatedItemValue: json['estimatedItemValue'] as double,
      deliveryFees: json['deliveryFees'] as double,
      tags: json['tags'] == null
          ? []
          : List<String>.from(json['tags'] as List<dynamic>),
      author: Author.fromJson(json),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'donationId': donationId,
      'imageUrl': imageUrl,
      'name': name,
      'category': category,
      'usedDuration': usedDuration,
      'usedDurationType': usedDurationType,
      'usedDurationTotal': usedDurationTotal.inDays,
      'usability': usability,
      'price': price,
      'estimatedItemValue': estimatedItemValue,
      'itemWidth': itemWidth,
      'itemLength': itemLength,
      'itemHeight': itemHeight,
      'weight': weight,
      'deliveryFees': deliveryFees,
      'deliveryPaidBy': deliveryPaidBy,
      'description': description,
      'tags': tags,
      'author': author.toJson(),
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
    //'DonationItem{donationId: $donationId, name: $name, description: $description, imageUrl: $imageUrl, category: $category, itemWidth: $itemWidth, itemLength: $itemLength, itemHeight: $itemHeight, weight: $weight, deliveryPaidBy: $deliveryPaidBy, usedDuration: $usedDuration, usedDurationType: $usedDurationType, usedDurationTotal: $usedDurationTotal, useability: $usability, price: $price, deliveryFees: $deliveryFees, tags: $tags, author: $author, isOverPriced: $isOverPriced, estimatedItemValue: $estimatedItemValue}';
  }
}
