import 'package:flutter/material.dart';
import 'package:flutter_project_20_21_ulangan/pages/login_page.dart';
import 'package:get/get.dart';
import 'dart:async';

class SplashScreenController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );

    scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.elasticOut),
    );

    animationController.forward();

    Timer(const Duration(seconds: 3), () {
      Get.off(() => const LoginPage());  
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
