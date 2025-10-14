import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/history_controller.dart';
import 'package:flutter_project_20_21_ulangan/mobile/history_mobile.dart';
import 'package:flutter_project_20_21_ulangan/widescreen/history_widescreen.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
  final historyController = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          historyController.updateLayout(constraints); 
          return Obx(() => historyController.isMobile.value 
              ? const HistoryMobile()
              : const HistoryWidescreen());
        },
      ),
    );
  }
}
