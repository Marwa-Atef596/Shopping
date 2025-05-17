import 'package:ecommerce_app/features/home/logic/controller/settings_controller.dart';

import '../controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(SettingsController());
  }
}
