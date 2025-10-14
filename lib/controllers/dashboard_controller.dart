import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/todo.dart';
import '../helper/db_helper.dart';
import 'history_controller.dart';

class DashboardController extends GetxController {
  var isMobile = true.obs;
  var todos = <Todo>[].obs;

  final DBHelper dbHelper = DBHelper();

  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }

  @override
  void onInit() {
    super.onInit();
    loadTodos(); // 🔹 ambil data dari database saat aplikasi dimulai
  }

  Future<void> loadTodos() async {
    final list = await dbHelper.getTodos();
    todos.assignAll(list);
  }

  Future<void> addTodo(Todo todo) async {
    await dbHelper.insertTodo(todo);
    await loadTodos(); 
  }

  Future<void> editTodo(int index, Todo updatedTodo) async {
    await dbHelper.updateTodo(updatedTodo);
    await loadTodos();
  }

  Future<void> toggleDone(int index) async {
    final todo = todos[index];
    final newStatus = !todo.isDone;
    await dbHelper.updateTodoDoneStatus(todo.id!, newStatus);
    todo.isDone = newStatus;
    todos[index] = todo;
  }

  Future<void> delete(int index) async {
    final todo = todos[index];
    await dbHelper.deleteTodo(todo.id!);
    todos.removeAt(index);

    // 🔹 simpan ke history (jika controller ada)
    if (Get.isRegistered<HistoryController>()) {
      Get.find<HistoryController>().addToHistory(todo);
    }
  }
}