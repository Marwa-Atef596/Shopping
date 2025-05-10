import 'package:ecommerce_app/core/utils/custom_button.dart';
import 'package:ecommerce_app/core/utils/text_utils.dart';
import 'package:ecommerce_app/features/home/logic/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCartTotal extends StatelessWidget {
  CustomCartTotal({super.key});
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            TextUtils(
                text: 'Total',
                fontSize: 18,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.w300),
            Obx(() {
              return TextUtils(
                  text: '\$${cartController.total}',
                  fontSize: 18,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w300);
            }),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: CustomButton(
            padding: EdgeInsets.all(10),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextUtils(
                    text: 'Check Out',
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
