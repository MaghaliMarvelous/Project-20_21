import 'package:flutter_project_20_21_ulangan/controllers/auth_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut<AuthController>(() => (AuthController()));
  }
}