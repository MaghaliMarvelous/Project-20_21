class Todo {
  int? id;
  String title;
  String description;
  String category;
  bool isDone;
  String? startTime;
  String? endTime;

  Todo({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    this.isDone = false,
    this.startTime,
    this.endTime,
  });
}