import '../../logic/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme.dart';
import '../../data/model/product_model/product_model.dart';

class CustomCartContainer extends StatelessWidget {
  CustomCartContainer({
    super.key,
    required this.productModel,
    required this.index,
    required this.quantenty,
  });
  final int index;
  final int quantenty;
  final ProductModel productModel;
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: mainColor.withAlpha(50),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            // Image
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Image.network(
                productModel.image ??
                    'https://images.unsplash.com/photo-1746433780060-986b6ff8287a?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 12),
            // Title & Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.title ?? "",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 18),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '\$${cartController.subTotal[index].toString()}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            // Controls
            Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        cartController.decreaseItem(productModel);
                      },
                      icon: Icon(
                        Icons.remove_circle,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        // size: 20,
                      ),
                    ),
                    Text(
                      '$quantenty',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        cartController.increaseItem(productModel);
                      },
                      icon: Icon(
                        Icons.add_circle,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        // size: 20,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    cartController.removeItem(productModel);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                    // size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
