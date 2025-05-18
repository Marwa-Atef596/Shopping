import 'package:get/get.dart';

import '../controller/auth_controller.dart';

class AuthBindiing extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
