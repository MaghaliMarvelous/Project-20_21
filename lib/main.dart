import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/auth_controller.dart';
import 'controllers/home_controller.dart';
import 'pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "ToDo App",
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<AuthController>(() => AuthController());
        Get.lazyPut<HomeController>(() => HomeController());
      }),
      home: LoginPage(),
    );
  }
}
