import 'package:ecommerce_app/features/authentecation/logic/controller/auth_controller.dart';
import 'package:get/get.dart';

class AuthBindiing extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
