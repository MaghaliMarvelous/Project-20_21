import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/todo.dart';
import '../helper/db_helper.dart';

class HistoryController extends GetxController {
  var isMobile = true.obs;
  var history = <Todo>[].obs;
  var isSelectionMode = false.obs;
  var selectedItems = <int>[].obs;

  final DBHelper dbHelper = DBHelper();

  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }

  @override
  void onInit() {
    super.onInit();
    loadHistory(); 
  }

  Future<void> loadHistory() async {
    final list = await dbHelper.getHistory();
    history.assignAll(list);
  }

  Future<void> addToHistory(Todo todo) async {
    await dbHelper.insertHistory(todo);
    await loadHistory();
  }

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

  Future<void> removeSelectedFromHistory() async {
    final items = selectedItems.map((i) => history[i]).toList();
    for (final todo in items) {
      await dbHelper.deleteHistory(todo.id!);
    }
    await loadHistory();
    selectedItems.clear();
    isSelectionMode.value = false;
  }
}
