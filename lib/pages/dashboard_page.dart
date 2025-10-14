import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import 'package:flutter_project_20_21_ulangan/mobile/dashboard_mobile.dart';
import 'package:flutter_project_20_21_ulangan/widescreen/dashboard_widescreen.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});
  final layoutController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          layoutController.updateLayout(constraints);
          return Obx(() => layoutController.isMobile.value
              ? const DashboardMobile()
              : const DashboardWidescreen());
        },
      ),
    );
  }
}
