import 'package:sahara/models/author.dart';
import 'package:sahara/utils/app_utils.dart';

class DonationItem {
  final String donationId;
  final String name, description, imageUrl, category;
  final double itemWidth, itemLength, itemHeight, weight;
  final DeliveryPaidBy deliveryPaidBy;
  final Duration usedDuration;
  final double useability, price, deliveryFees;
  final List<String> tags;
  final Author author;
  final bool isOverPriced;
  final double estimatedItemValue;

  DonationItem({
    required this.donationId,
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
    required this.useability,
    required this.price,
    required this.deliveryFees,
    required this.tags,
    required this.author,
  })  : estimatedItemValue = price * useability,
        isOverPriced = deliveryFees > price * useability;

  factory DonationItem.test() {
    return DonationItem(
        donationId: '12',
        name: 'James',
        description:
            'I am thrilled to announce a special giveaway of a premium water bottle that is practically brand new! This sleek and stylish hydration company.This sleek and stylish hydration company ',
        imageUrl:
            'https://img.freepik.com/premium-photo/silver-steel-fridge-model-isolated-white-background_124507-67356.jpg',
        category: 'Refrigerator',
        itemWidth: 20,
        itemLength: 10,
        itemHeight: 50,
        weight: 120,
        deliveryPaidBy: DeliveryPaidBy.self,
        usedDuration: const Duration(days: 14),
        useability: 0.80,
        price: 5000,
        deliveryFees: 500,
        tags: ['fridge', 'giveaway'],
        author: Author(
            authorId: '12',
            name: 'James',
            imageUrl:
                'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg'));
  }
  factory DonationItem.fromJson(Map<String, dynamic> json) {
    return DonationItem(
        donationId: json['donationId'],
        name: json['name'],
        description: json['description'],
        imageUrl: json['imageUrl'],
        category: json['category'],
        itemWidth: json['itemWidth'],
        itemLength: json['itemLength'],
        itemHeight: json['itemHeight'],
        weight: json['weight'],
        deliveryPaidBy: json['deliveryPaidBy'],
        usedDuration: json['usedDuration'],
        useability: json['useability'],
        price: json['price'],
        deliveryFees: json['deliveryFees'],
        tags: json['tags'],
        author: Author.fromJson(json['author']));
  }
}
