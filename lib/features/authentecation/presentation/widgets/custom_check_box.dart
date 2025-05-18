import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controller/auth_controller.dart';

class CustomCheckBox extends StatelessWidget {
  CustomCheckBox({super.key});
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return InkWell(
          onTap: () {
            controller.checkBox();
          },
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: controller.isCheck
                ? Image.asset('assets/images/check.png')
                : Container(),
          ));
    });
  }
}
