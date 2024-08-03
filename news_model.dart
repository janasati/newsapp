class News {
  final String text;
  final String author;
  final String imageUrl; // New field for the image URL

  News({
    required this.text,
    required this.author,
    required this.imageUrl,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      text: json['text'] ?? '',
      author: json['author'] ?? '',
      imageUrl: json['image_url'] ?? '',
    );
  }
}
