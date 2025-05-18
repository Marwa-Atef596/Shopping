import '../controller/payment_controller.dart';
import '../controller/settings_controller.dart';

import '../controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(SettingsController());
    Get.put(PaymentController(), permanent: true);
  }
}
