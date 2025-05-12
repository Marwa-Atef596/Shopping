import '../../../../core/theme.dart';
import '../../../authentecation/logic/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controller/theme_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              ThemeController().changeTheme();
            },
            child: Text(
              'Themes',
              style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black),
            ),
          ),
          GetBuilder<AuthController>(builder: (controller) {
            return TextButton(
              onPressed: () {
                Get.defaultDialog(
                  title: 'LogOut',
                  middleText: 'are you sure?',
                  textCancel: 'No',
                  textConfirm: 'Yes',
                  buttonColor: Get.isDarkMode ? Colors.white : mainColor,
                  onConfirm: () {
                    controller.signOut();
                  },
                );
              },
              child: Text('logOut'),
            );
          })
        ],
      ),
    );
  }
}
