import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme.dart';
import '../../../../core/utils/custom_button.dart';
import '../../../../core/utils/text_utils.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 150,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          SizedBox(
            height: 50,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: 'Your Cart is ',
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: 'Empty',
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : mainColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextUtils(
              text: 'Add Item to Get Start',
              fontSize: 18,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500),
          SizedBox(
            height: 20,
          ),
          CustomButton(
            onPressed: () {},
            child: TextUtils(
              text: 'GO to Home',
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
