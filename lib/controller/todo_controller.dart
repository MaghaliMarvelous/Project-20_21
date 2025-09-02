import 'package:get/get.dart';

class Todo {
  String title;
  bool isDone;

  Todo({
    required this.title,
    this.isDone = false,
  });
}

class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  void tambah(String title) {
    todos.add(Todo(title: title));
  }

  void selesai(int index) {
    if (index >= 0 && index < todos.length) {
      todos[index].isDone = !todos[index].isDone;
      todos.refresh();
    }
  }

  void hapus(int index) {
    if (index >= 0 && index < todos.length) {
      todos.removeAt(index);
    }
  }
}