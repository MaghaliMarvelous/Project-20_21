import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Controller hanya diinisialisasi sekali (permanent: true)
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}