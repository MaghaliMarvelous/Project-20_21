import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splashscreen_controller.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashScreenController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: controller.scaleAnimation,
              child: Image.asset("assets/Pink Guitar.png", height: 120),
            ),
            const SizedBox(height: 20),
            FadeTransition(
              opacity: controller.fadeAnimation,
              child: const Text(
                "Song Pink",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(height: 12),
            FadeTransition(
              opacity: controller.fadeAnimation,
              child: const Text(
                "Feel the rhythm. Live the pink.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.pinkAccent,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
