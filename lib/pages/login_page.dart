import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../components/primary_button.dart';
import '../components/input_field.dart';

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
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
    );
    return;
  }

  final success = await authController.login(email, password);
  if (!success) {
    Get.snackbar(
      "Login Failed",
      "Invalid email or password",
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
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
              // Image
              SizedBox(
                height: 150,
                child: Image.network(
                  "https://i.pinimg.com/474x/99/5f/bc/995fbca5ca77c7af00d495d25f9529d4.jpg",
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),

              // Reused input fields
              InputField(
                controller: emailController,
                hintText: "Email",
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 16),

              InputField(
                controller: passwordController,
                hintText: "Password",
                icon: Icons.lock_outline,
                obscure: true,
              ),
              const SizedBox(height: 20),

              // Reused button
              PrimaryButton(label: "Login", onPressed: _handleLogin),
            ],
          ),
        ),
      ),
    );
  }
}
