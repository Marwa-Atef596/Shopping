import 'package:ecommerce_app/features/home/logic/controller/cart_controller.dart';
import 'package:get/get.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
    Get.lazyPut(() => CartController());
  }
}
