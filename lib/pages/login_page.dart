import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../components/input_field.dart';
import '../components/primary_button.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  void _handleLogin() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "Email and Password cannot be empty",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final success = authController.login(email, password);
    if (!success) {
      Get.snackbar(
        "Login Failed",
        "Invalid email or password",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Illustration
              SizedBox(
                    height: 200,
                    child: Image.asset(
                      "assets/Pink Guitar.png",
                      fit: BoxFit.contain,
                    ),
                  ),
              const SizedBox(height: 30),
              InputField(
                controller: emailController,
                hintText: "Username",
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),

              // Password
              InputField(
                controller: passwordController,
                hintText: "Password",
                icon: Icons.lock_outline,
                obscure: true,
              ),
              const SizedBox(height: 12),
            
              const SizedBox(height: 10),

              // Login button
              PrimaryButton(label: "Login", onPressed: _handleLogin),
              const SizedBox(height: 20),

          
            ],
          ),
        ),
      ),
    );
  }
}
