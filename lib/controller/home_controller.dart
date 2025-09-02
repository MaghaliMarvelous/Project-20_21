import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  void setIndex(int index) {
    if (selectedIndex.value != index) {
      selectedIndex.value = index;
    }
  }
}