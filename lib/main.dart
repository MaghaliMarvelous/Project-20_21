import 'package:flutter/material.dart';
import 'package:flutter_project_20_21_ulangan/pages/splashscreen_page.dart';
import 'package:get/get.dart';
import 'controllers/theme_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(() => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode:
              themeController.isDark.value ? ThemeMode.dark : ThemeMode.light,
          home: const SplashScreenPage(),
        ));
  }
}
