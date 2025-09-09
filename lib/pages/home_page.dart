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

    return Obx(() {
      Widget body;
      switch (controller.selectedIndex.value) {
        case 0:
          body = const DashboardPage(); // todo handled inside DashboardPage
          break;
        case 1:
          body = const HistoryPage();   // history handled inside HistoryPage
          break;
        case 2:
        default:
          body = const ProfilePage();
      }

      return Scaffold(
        body: body,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.setIndex,
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
