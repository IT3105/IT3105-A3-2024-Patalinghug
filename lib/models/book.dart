class Book {
  String name;
  String author;
  String genre;
  String status;

  Book({
    required this.name,
    required this.author,
    required this.genre,
    this.status = 'to read',
  });
}