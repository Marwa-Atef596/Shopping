import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/custom_button.dart';
import '../../../../core/utils/text_utils.dart';
import '../../data/model/product_model/product_model.dart';
import '../../logic/controller/cart_controller.dart';

class AddCartButton extends StatelessWidget {
  AddCartButton({super.key, required this.productModel});
  final cartController = Get.find<CartController>();
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              TextUtils(
                  text: 'Price',
                  fontSize: 18,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w300),
              TextUtils(
                  text: '\$${productModel.price}',
                  fontSize: 18,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: CustomButton(
              padding: EdgeInsets.all(10),
              onPressed: () {
                cartController.increaseItem(productModel);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextUtils(
                      text: 'Add to Cart',
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
      ),
    );
  }
}
