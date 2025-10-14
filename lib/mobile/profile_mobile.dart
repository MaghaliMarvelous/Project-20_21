import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/theme_controller.dart';
import '../pages/login_page.dart';

class ProfileMobile extends StatelessWidget {
  const ProfileMobile({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Cancel")),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              Get.offAll(() => const LoginPage());
            },
            child: const Text("Logout", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        actions: [
          Obx(() => Switch(
                value: themeController.isDark.value,
                activeColor: Colors.pinkAccent,
                onChanged: (_) => themeController.toggleTheme(),
              )),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.pinkAccent),
            onPressed: () => _showLogoutDialog(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildProfileCard(
              context,
              "https://i.pinimg.com/736x/5f/1f/1b/5f1f1be3493ee6eab6744373a109d308.jpg",
              "Maghali Arka Nugraha",
              "Absen 20\nXI PPLG 1",
              Icons.piano,
            ),
            const SizedBox(height: 30),
            buildProfileCard(
              context,
              "https://i.pinimg.com/736x/e4/0c/01/e40c01326bfa4ae9fb425c6d3236e5c2.jpg",
              "Maximillian Mikhael Prabowo",
              "Absen 21\nXI PPLG 1",
              Icons.palette,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfileCard(
    BuildContext context,
    String imageUrl,
    String name,
    String description,
    IconData icon,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(radius: 50, backgroundImage: NetworkImage(imageUrl)),
        const SizedBox(height: 10),
        Text(name,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge?.color)),
        Text(description,
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color)),
        const SizedBox(height: 8),
        Icon(icon, color: Theme.of(context).colorScheme.secondary, size: 28),
      ],
    );
  }
}