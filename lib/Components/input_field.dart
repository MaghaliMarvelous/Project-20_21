import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool obscure;
  final bool showToggle;
  final VoidCallback? onToggleObscure;

  final Color? borderColor;

  const InputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.obscure = false,
    this.showToggle = false,
    this.onToggleObscure,
    this.borderColor,
  });

  @override
Widget build(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  return TextField(
    controller: controller,
    obscureText: obscure,
    style: TextStyle(color: isDark ? Colors.white : Colors.pink), // dynamic text color
    decoration: InputDecoration(
      prefixIcon: Icon(icon, color: Colors.pink),
      hintText: hintText,
      hintStyle: TextStyle(color: isDark ? Colors.white54 : Colors.black54),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: borderColor ?? Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: borderColor ?? Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.pink),
      ),
      suffixIcon: showToggle
          ? IconButton(
              icon: Icon(
                obscure ? Icons.visibility : Icons.visibility_off,
                color: Colors.pink,
              ),
              onPressed: onToggleObscure,
            )
          : null,
    ),
  );
}

}
