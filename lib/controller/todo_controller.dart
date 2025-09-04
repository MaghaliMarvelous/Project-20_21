import 'package:get/get.dart';
import '../models/todo.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  void addTodo(String title, String description, String category) {
    todos.add(Todo(
      title: title,
      description: description,
      category: category,
    ));
  }

  void markDone(int index) {
    todos[index].isDone = true;
    todos.refresh(); 
  }

  void deleteTodo(int index) {
    todos.removeAt(index);
  }

  List<Todo> get history => todos.where((t) => t.isDone).toList();
}
