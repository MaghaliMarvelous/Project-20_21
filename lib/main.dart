import 'package:flutter/material.dart';
import 'package:flutter_project_20_21_ulangan/bindings/app_binding.dart';
import 'package:get/get.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "ToDo App",
      initialBinding: AppBinding(),
      home: LoginPage(),
    );
  }
}
