import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/history_controller.dart';
import '../controllers/history_layout_controller.dart';
import 'package:flutter_project_20_21_ulangan/mobile/history_mobile.dart';
import 'package:flutter_project_20_21_ulangan/widescreen/history_widescreen.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
  final layoutController = Get.put(HistoryLayoutController());
  final historyController = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          layoutController.updateLayout(constraints);
          return Obx(() => layoutController.isMobile.value
              ? const HistoryMobile()
              : const HistoryWidescreen());
        },
      ),
    );
  }
}
