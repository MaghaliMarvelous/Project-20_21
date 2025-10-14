import 'package:get/get.dart';
import '../models/todo.dart';

class HistoryController extends GetxController {
  var history = <Todo>[].obs;
  var isSelectionMode = false.obs;
  var selectedItems = <int>[].obs;

  void toggleSelectionMode() {
    isSelectionMode.value = !isSelectionMode.value;
    selectedItems.clear();
  }

  void toggleItemSelection(int index) {
    if (selectedItems.contains(index)) {
      selectedItems.remove(index);
    } else {
      selectedItems.add(index);
    }
  }

  void removeSelectedFromHistory() {
    selectedItems.sort((a, b) => b.compareTo(a));
    for (var index in selectedItems) {
      history.removeAt(index);
    }
    selectedItems.clear();
    isSelectionMode.value = false;
  }

  void addToHistory(Todo todo) {
    history.add(todo);
  }
}
