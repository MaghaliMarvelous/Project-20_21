import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dashboard_page.dart';
import 'history_page.dart';
import 'profile_page.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final PageController pageController = PageController();

    return Obx(() {
      return Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            controller.setIndex(index);
          },
          children: const [
            DashboardPage(),
            HistoryPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: (index) {
            controller.setIndex(index);
            pageController.jumpToPage(index); // langsung pindah (tanpa animasi)
            // kalau mau animasi halus:
            pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          },
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: "Dashboard"),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      );
    });
  }
}
