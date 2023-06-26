class Review {
  final String reviewId;
  final String reviewerId;
  final String donationId;
  final String reviewText;
  final String name;
  final String imageUrl;
  final String donationItemId;
  final String receiverName;
  final String donorName;
  final int usability;
  final int usedDuration;
  final int rating;
  final double price;

  Review(
      {required this.reviewId,
      required this.reviewerId,
      required this.donationId,
      required this.reviewText,
      required this.name,
      required this.imageUrl,
      required this.donationItemId,
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
      donationItemId: 'donationId',
      name: "Chair",
      donorName: "Thomas Shelby",
      receiverName: "James Shelby",
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Test-Logo.svg/1200px-Test-Logo.svg.png",
      rating: 0,
      price: 100,
      usability: 50,
      usedDuration: 9,
      reviewText:
          "I'm absolutely thrilled about the wonderful water bottle you graciously gave me! It has truly become an essential part of my daily routine, I'm absolutely thrilled about the wonderful water bottle you graciously gave me! It has truly become an essential part of my daily routine,",
    );
  }

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
        reviewId: json['reviewId'],
        reviewerId: json['reviewerId'],
        donationId: json['donationId'],
        reviewText: json['reviewText'],
        name: json['name'],
        imageUrl: json['imageUrl'],
        donationItemId: json['donationItemId'],
        receiverName: json['receiverName'],
        donorName: json['donorName'],
        usability: json['usability'],
        usedDuration: json['usedDuration'],
        rating: json['rating'],
        price: json['price']);
  }
}
