class BookModel {
  String title;
  String author;
  String description;
  String imageUrl;
  bool isAvailable;

  BookModel({
    required this.title,
    required this.author,
    required this.description,
    required this.imageUrl,
    this.isAvailable = true, 
  });
}