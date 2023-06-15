class Review {
  final String reviewId, reviewerId, donationId, reviewText;
  final String name, imageUrl;

  Review({
    required this.reviewId,
    required this.reviewerId,
    required this.donationId,
    required this.reviewText,
    required this.name,
    required this.imageUrl,
  });

  factory Review.test() {
    return Review(
      reviewId: 'reviewId',
      reviewerId: 'reviewerId',
      donationId: 'donationId',
      reviewText:
          "I'm absolutely thrilled about the wonderful water bottle you graciously gave me! It has truly become an essential part of my daily routine, a...",
      name: 'Khush Agarwal',
      imageUrl: 'imageUrl',
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
    );
  }
}
