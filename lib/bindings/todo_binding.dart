import 'package:flutter_project_20_21_ulangan/controllers/todo_controller.dart';
import 'package:get/get.dart';

class TodoBinding extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut<TodoController>(() => TodoController());
  }
}