import '../../../../core/theme.dart';
import '../../../../core/utils/text_utils.dart';
import '../widgets/custom_cart_total.dart';
import '../widgets/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controller/cart_controller.dart';
import '../widgets/custom_cart_container.dart';

class CartScreen extends StatelessWidget {
  CartScreen({
    super.key,
  });
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.black : mainColor,
          title: TextUtils(
              text: 'Cart Items',
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w500),
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            IconButton(
              onPressed: () {
                cartController.cleareAllItems();
              },
              icon: Icon(Icons.backspace),
              color: Colors.white,
            )
          ],
        ),
        body: Obx(() {
          if (cartController.productMap.isEmpty) {
            return EmptyCart();
          } else {
            return Stack(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.1),
                    child: ListView.separated(
                      itemCount: cartController.productMap.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 5,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return CustomCartContainer(
                          productModel:
                              cartController.productMap.keys.toList()[index],
                          index: index,
                          quantenty:
                              cartController.productMap.values.toList()[index],
                        );
                      },
                    )),
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 8,
                  child: CustomCartTotal(),
                )
              ],
            );
          }
        }));
  }
}
