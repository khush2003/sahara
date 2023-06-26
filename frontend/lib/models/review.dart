class Review {
  final String? reviewId;
  final String reviewerId;
  final String donationId;
  final String reviewText;
  final String name;
  final String imageUrl;
  final String receiverName;
  final String donorName;
  final double usability;
  final Duration usedDuration;
  final int rating;
  final double price;

  Review(
      {this.reviewId,
      required this.reviewerId,
      required this.donationId,
      required this.reviewText,
      required this.name,
      required this.imageUrl,
      required this.receiverName,
      required this.donorName,
      required this.usability,
      required this.usedDuration,
      required this.rating,
      required this.price});

  factory Review.test() {
    return Review(
      reviewId: 'reviewId',
      reviewerId: 'reviewerId',
      donationId: 'donationId',
      name: "Chair",
      donorName: "Thomas Shelby",
      receiverName: "James Shelby",
      imageUrl: "",
      rating: 0,
      price: 100,
      usability: 50,
      usedDuration: const Duration(days: 14),
      reviewText:
          "I'm absolutely thrilled about the wonderful water bottle you graciously gave me! It has truly become an essential part of my daily routine, I'm absolutely thrilled about the wonderful water bottle you graciously gave me! It has truly become an essential part of my daily routine,",
    );
  }

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
        reviewId: json['reviewId'],
        reviewerId: json['reviewerId'],
        donationId: json['donationId'],
        reviewText: json['reviewText'] ?? '',
        name: json['name'] ?? '',
        imageUrl: json['imageUrl'] ?? '',
        receiverName: json['receiverName'] ?? '',
        donorName: json['donorName'] ?? '',
        usability: json['usability'] ?? double,
        usedDuration: json['usedDuration'] ?? Duration,
        rating: json['rating'] ?? int,
        price: json['price'] ?? double);
  }

  
  Map<String, dynamic> toJson() {
    return {
      
      'reviewerId': reviewerId,
      'donationId': donationId,
      'reviewText': reviewText,
      'name': name,
      'imageUrl': imageUrl,
      'receiverName': receiverName,
      'donorName': donorName,
      'usability': usability,
      'usedDuration': usedDuration,
      'rating': rating,
      'price': price,
    };
  }
}