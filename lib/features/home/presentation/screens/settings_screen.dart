import 'package:ecommerce_app/core/utils/text_utils.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/dark_mode_widget.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/language_widget.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/log_out.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/profie_widget.dart';

import '../../../../core/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.all(20),
      children: [
        SizedBox(
          height: 10,
        ),
        ProfieWidget(),
        Divider(
          thickness: 2,
          color: Get.isDarkMode ? Colors.white : Colors.grey,
        ),
        SizedBox(
          height: 20,
        ),
        TextUtils(
            text: 'GENERAL'.tr,
            fontSize: 18,
            color: mainColor,
            fontWeight: FontWeight.bold),
        SizedBox(
          height: 20,
        ),
        DarkModeWidget(),
        SizedBox(
          height: 20,
        ),
        LanguageWidget(),
        SizedBox(
          height: 20,
        ),
        LogOut(),
      ],
    )

        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     TextButton(
        //       onPressed: () {
        //         ThemeController().changeTheme();
        //       },
        //       child: Text(
        //         'Themes',
        //         style: TextStyle(
        //             color: Get.isDarkMode ? Colors.white : Colors.black),
        //       ),
        //     ),
        //     GetBuilder<AuthController>(builder: (controller) {
        //       return TextButton(
        //         onPressed: () {
        //           Get.defaultDialog(
        //             title: 'LogOut',
        //             middleText: 'are you sure?',
        //             textCancel: 'No',
        //             textConfirm: 'Yes',
        //             buttonColor: Get.isDarkMode ? Colors.white : mainColor,
        //             onConfirm: () {
        //               controller.signOut();
        //             },
        //           );
        //         },
        //         child: Text('logOut'),
        //       );
        //     })
        //   ],
        // ),
        );
  }
}
