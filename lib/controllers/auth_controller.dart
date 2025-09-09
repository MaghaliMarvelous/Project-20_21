import 'package:get/get.dart';
import '../pages/home_page.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  var userEmail = "".obs;

  bool login(String email, String password) {
    if (email == "migel" && password == "kaoskutank") {
      isLoggedIn.value = true;
      userEmail.value = email;

      Get.offAll(() => HomePage());
      return true;
    }
    return false;
  }

  void logout() {
    isLoggedIn.value = false;
    userEmail.value = "";
  }
}
