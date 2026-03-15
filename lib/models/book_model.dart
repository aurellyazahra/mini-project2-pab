class BookModel {
  final String? id;
  final String title;
  final String author;
  final String description;
  final String imageUrl;
  bool isAvailable;

  BookModel({
    this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.imageUrl,
    this.isAvailable = true,
  });

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      id: map['id'],
      title: map['title'] ?? '',
      author: map['author'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      isAvailable: map['isAvailable'] ?? true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'description': description,
      'imageUrl': imageUrl,
      'isAvailable': isAvailable,
    };
  }
}