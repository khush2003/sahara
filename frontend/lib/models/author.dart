class Author {
  final String authorId;
  final String name, imageUrl;

  Author({
    required this.authorId,
    required this.name,
    required this.imageUrl,
  });

  factory Author.test() {
    return Author(
      authorId: '1',
      name: 'John Doe',
      imageUrl: 'https://picsum.photos/200',
    );
  }

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      authorId: json['authorId'],
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }
}
