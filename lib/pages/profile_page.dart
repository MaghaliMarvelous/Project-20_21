import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import 'package:flutter_project_20_21_ulangan/mobile/profile_mobile.dart';
import 'package:flutter_project_20_21_ulangan/widescreen/profile_widescreen.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final layoutController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          layoutController.updateLayout(constraints);
          return Obx(() => layoutController.isMobile.value
              ? const ProfileMobile()
              : const ProfileWidescreen());
        },
      ),
    );
  }
}