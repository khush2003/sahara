class Review {
  final String? reviewId;
  final String reviewerId;
  final String donationId;
  final String reviewText;
  final String reviewerName;
  final String reviewerImageURL;
  final int rating;

  Review( {
    this.reviewId,
    required this.rating,
    required this.reviewerId,
    required this.donationId,
    required this.reviewText,
    required this.reviewerName,
    required this.reviewerImageURL,
  });

  factory Review.test() {
    return Review(
      reviewId: 'reviewId',
      reviewerId: 'reviewerId',
      donationId: 'donationId',
      reviewerName: "Chair",
      reviewerImageURL: "",
      reviewText:
          "I'm absolutely thrilled about the wonderful water bottle you graciously gave me! It has truly become an essential part of my daily routine, I'm absolutely thrilled about the wonderful water bottle you graciously gave me! It has truly become an essential part of my daily routine,", rating: 200,
    );
  }

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      reviewId: json['reviewId'],
      reviewerId: json['reviewerId'],
      donationId: json['donationId'],
      reviewText: json['reviewText'] ?? '',
      reviewerName: json['reviewerName'] ?? '',
      reviewerImageURL: json['reviewerImageURL'] ?? '', 
      rating: json['rating'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reviewId': reviewId,
      'reviewerId': reviewerId,
      'donationId': donationId,
      'reviewText': reviewText,
      'name': reviewerName,
      'imageUrl': reviewerImageURL,
      'rating': rating
    };
  }
}
