import 'package:get/get.dart';
import '../models/todo.dart';

class DashboardController extends GetxController {
  var todos = <Todo>[].obs;
  var history = <Todo>[].obs;

  void addTodo(Todo todo) {
    todos.add(todo);
  }

  void toggleDone(int index) {
    todos[index].isDone = !todos[index].isDone;
    todos.refresh();
  }

  void delete(int index) {
    final removed = todos.removeAt(index);
    history.add(removed);
  }
}
