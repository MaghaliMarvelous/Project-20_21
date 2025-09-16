import 'package:get/get.dart';
import '../models/todo.dart';

class DashboardController extends GetxController {
  var todos = <Todo>[].obs;
  var history = <Todo>[].obs;

  // state untuk multi select
  var isSelectionMode = false.obs;
  var selectedItems = <int>[].obs;

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

  // multi select toggle
  void toggleSelectionMode() {
    isSelectionMode.value = !isSelectionMode.value;
    if (!isSelectionMode.value) {
      selectedItems.clear();
    }
  }

  // pilih/batal pilih item
  void toggleItemSelection(int index) {
    if (selectedItems.contains(index)) {
      selectedItems.remove(index);
    } else {
      selectedItems.add(index);
    }
  }

  // hapus semua yang dipilih dari history
  void removeSelectedFromHistory() {
    selectedItems.sort((a, b) => b.compareTo(a)); // biar aman hapus dari belakang
    for (var index in selectedItems) {
      if (index >= 0 && index < history.length) {
        history.removeAt(index);
      }
    }
    selectedItems.clear();
    isSelectionMode.value = false;
  }
}
