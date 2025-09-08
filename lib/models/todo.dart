class Todo {
  final String title;
  final String description;
  final String category;
  bool isDone;

  Todo({
    required this.title,
    required this.description,
    required this.category,
    this.isDone = false,
  });
}
