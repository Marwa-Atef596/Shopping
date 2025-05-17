import 'package:ecommerce_app/core/theme.dart';
import 'package:ecommerce_app/features/authentecation/logic/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/text_utils.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: GetBuilder<AuthController>(builder: (controller) {
          return InkWell(
            onTap: () {
              Get.defaultDialog(
                title: 'LogOut'.tr,
                middleText: 'are you sure?',
                textCancel: 'No',
                textConfirm: 'Yes',
                buttonColor: Get.isDarkMode ? Colors.white : mainColor,
                onConfirm: () {
                  controller.signOut();
                },
              );
            },
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: logOutSettings,
                  ),
                  child: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                TextUtils(
                  text: 'LogOut'.tr,
                  fontSize: 22,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
          );
        }));
  }
}
