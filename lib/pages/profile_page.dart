import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_page.dart'; // pastikan import login page

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.pinkAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.pinkAccent),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.pinkAccent),
            onPressed: () {
              _showLogoutWarning(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildProfile(
              "https://i.pinimg.com/736x/5f/1f/1b/5f1f1be3493ee6eab6744373a109d308.jpg",
              "Migel",
              "Absen 20 dan 21 11 PPLG 1",
              const Icon(Icons.piano,
                  color: Colors.pinkAccent, size: 28),
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
            onPressed: () {
              Navigator.of(ctx).pop(); // tutup dialog
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop(); 
              Get.offAll(() => LoginPage());
            },
            child: const Text(
              "Logout",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProfile(
      String imageUrl, String name, String description, Widget icon) {
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
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          description,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 8),
        icon,
      ],
    );
  }
}
