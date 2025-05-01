import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isVisible = false;
  bool isCheck = false;

  void visability() {
    isVisible = !isVisible;
    update();
  }

  void checkBox() {
    isCheck = !isCheck;
    update();
  }
}
