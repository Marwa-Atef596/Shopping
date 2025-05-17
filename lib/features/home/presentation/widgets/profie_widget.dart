import 'package:ecommerce_app/core/utils/text_utils.dart';
import 'package:ecommerce_app/features/authentecation/logic/controller/auth_controller.dart';
import 'package:ecommerce_app/features/home/logic/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfieWidget extends StatelessWidget {
  ProfieWidget({super.key});
  final controller = Get.find<SettingsController>();
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 100,
        width: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: NetworkImage(authController.displayPhoto.value),
                fit: BoxFit.cover),
            shape: BoxShape.circle),
      ),
      title: TextUtils(
          text: controller.capitalize(authController.displayName.value),
          fontSize: 18,
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500),
      subtitle: TextUtils(
          text: authController.displayEmail.value,
          fontSize: 14,
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontWeight: FontWeight.normal),
    );
  }
}
