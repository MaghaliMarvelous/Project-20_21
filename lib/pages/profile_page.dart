import 'package:flutter/material.dart';

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
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildProfile(
              "assets/Octopus dude.jpg",
              "Maghali Arka Nugraha",
              "Absen 20 11 PPLG 1",
              const Icon(Icons.piano,
                  color: Colors.pinkAccent, size: 28), 
            ),
            buildProfile(
              "assets/Kucing El.jpg",
              "Maximillian Mikhael Prabowo",
              "Absen 21 11 PPLG 1",
              Image.network(
                "https://cdn-icons-png.flaticon.com/512/3011/3011376.png", 
                height: 28,
                width: 28,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.queue_music,
                      color: Colors.pinkAccent, size: 28); // fallback
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfile(
      String assetPath, String name, String description, Widget icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(assetPath),
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
