import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  final selectedIndex = 0.obs;
  final pageController = PageController();

  void setIndex(int index) {
    selectedIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
