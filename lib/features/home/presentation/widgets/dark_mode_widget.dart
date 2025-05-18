import '../../../../core/theme.dart';
import '../../../../core/utils/text_utils.dart';
import '../../logic/controller/settings_controller.dart';
import '../../logic/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({super.key});
  final controller = Get.find<SettingsController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildIcon(),
        Obx(() {
          return Switch(
              activeColor: mainColor,
              activeTrackColor: mainColor,
              value: controller.switchValue.value,
              onChanged: (value) {
                ThemeController().changeTheme();
                controller.switchValue.value = value;
              });
        }),
      ],
    );
  }

  Widget buildIcon() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: darkSettings,
            ),
            child: Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          TextUtils(
            text: 'Dark Mode'.tr,
            fontSize: 22,
            color: Get.isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          )
        ],
      ),
    );
  }
}
