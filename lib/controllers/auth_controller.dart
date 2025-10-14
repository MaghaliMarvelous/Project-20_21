import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  var userEmail = "".obs;

  
  Future<bool> login(String email, String password) async {
    if (email == "migel" && password == "kaoskutank") {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('userEmail', email);

      isLoggedIn.value = true;
      userEmail.value = email;

      Get.offAll(() => const HomePage());
      return true;
    }
    return false;
  }

  /// 🔹 Load login state when app starts
  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final loggedIn = prefs.getBool('isLoggedIn') ?? false;
    final email = prefs.getString('userEmail') ?? "";

    isLoggedIn.value = loggedIn;
    userEmail.value = email;

    if (loggedIn) {
      Get.offAll(() => const HomePage());
    } else {
      Get.offAll(() => const LoginPage());
    }
  }

  /// 🔹 Logout and clear stored data
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    isLoggedIn.value = false;
    userEmail.value = "";

    Get.offAll(() => const LoginPage());
  }
}
