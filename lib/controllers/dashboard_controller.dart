import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/todo.dart';
import 'history_controller.dart';

class DashboardController extends GetxController {

   var isMobile = true.obs;

  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }
  var todos = <Todo>[].obs;

  void addTodo(Todo todo) => todos.add(todo);

  void editTodo(int index, Todo updatedTodo) => todos[index] = updatedTodo;

  void toggleDone(int index) {
    todos[index].isDone = !todos[index].isDone;
    todos.refresh();
  }

  void delete(int index) {
    final deleted = todos.removeAt(index);
    if (Get.isRegistered<HistoryController>()) {
      Get.find<HistoryController>().addToHistory(deleted);
    }
  }
}