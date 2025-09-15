import 'package:get/get.dart';

class DashboardBinding extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut<DashboardBinding>(() => DashboardBinding());
  }
}