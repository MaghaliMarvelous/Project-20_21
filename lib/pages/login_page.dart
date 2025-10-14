import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../Components/input_field.dart';
import '../Components/primary_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;

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

  final success = await authController.login(email, password); 
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 200,
                child: Image.asset(
                  "assets/Pink Guitar.png",
                  fit: BoxFit.contain,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : null, // optional: invert for dark mode
                ),
              ),
              const SizedBox(height: 30),

              // Username
              InputField(
                controller: emailController,
                hintText: "Username",
                icon: Icons.person_outline,
                borderColor: Theme.of(context).dividerColor,
              ),
              const SizedBox(height: 16),

              InputField(
                controller: passwordController,
                hintText: "Password",
                icon: Icons.lock_outline,
                obscure: _obscurePassword,
                showToggle: true,
                onToggleObscure: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
                borderColor: Theme.of(context).dividerColor,
              ),
              const SizedBox(height: 20),

              PrimaryButton(
                label: "Login",
                onPressed: _handleLogin,
                backgroundColor: Colors.pink,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
