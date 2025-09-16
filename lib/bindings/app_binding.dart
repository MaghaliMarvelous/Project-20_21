import 'package:flutter_project_20_21_ulangan/controllers/auth_controller.dart';
import 'package:flutter_project_20_21_ulangan/controllers/dashboard_controller.dart';
import 'package:flutter_project_20_21_ulangan/controllers/history_controller.dart';
import 'package:flutter_project_20_21_ulangan/controllers/home_controller.dart';
import 'package:flutter_project_20_21_ulangan/controllers/todo_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut<AuthController>(() => (AuthController()));
  Get.lazyPut<DashboardController>(() => DashboardController());
  Get.lazyPut<HomeController>(() => HomeController());
  Get.lazyPut<TodoController>(() => TodoController());
  Get.lazyPut<HistoryController>(() => HistoryController());
  }
}