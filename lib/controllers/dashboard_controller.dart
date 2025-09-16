import 'package:get/get.dart';
import '../models/todo.dart';
import 'history_controller.dart';

class DashboardController extends GetxController {
  var todos = <Todo>[].obs;

  void addTodo(Todo todo) {
    todos.add(todo);
  }

  void toggleDone(int index) {
    todos[index].isDone = !todos[index].isDone;
    todos.refresh();
  }

  void delete(int index) {
    final removed = todos.removeAt(index);
    // kirim ke HistoryController
    final historyController = Get.find<HistoryController>();
    historyController.addToHistory(removed);
  }
}
