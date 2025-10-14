import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/theme_controller.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.secondary),
        actions: [
          Obx(() => Switch(
                value: themeController.isDark.value,
                activeColor: Colors.pinkAccent,
                onChanged: (_) => themeController.toggleTheme(),
              )),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.pinkAccent),
            onPressed: () => _showLogoutWarning(context),
          ),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildProfile(
              context,
              "https://i.pinimg.com/736x/5f/1f/1b/5f1f1be3493ee6eab6744373a109d308.jpg",
              "Migel",
              "Absen 20 dan 21 11 PPLG 1",
              Icon(Icons.piano,
                  color: Theme.of(context).colorScheme.secondary, size: 28),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutWarning(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Get.offAll(() => const LoginPage());
            },
            child: const Text("Logout", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Widget buildProfile(BuildContext context, String imageUrl, String name,
      String description, Widget icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(imageUrl),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
        Text(
          description,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
        ),
        const SizedBox(height: 8),
        icon,
      ],
    );
  }
}
