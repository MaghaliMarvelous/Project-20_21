import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  var userEmail = RxnString();

  // Simulate login
  Future<bool> login(String email, String password) async {
    if (email == "migel" && password == "kaoskutank") {
      isLoggedIn.value = true;
      userEmail.value = email;
      return true;
    }
    return false;
  }

  void logout() {
    isLoggedIn.value = false;
    userEmail.value = null;
  }
}