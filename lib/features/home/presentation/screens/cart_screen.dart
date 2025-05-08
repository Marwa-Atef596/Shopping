import 'package:ecommerce_app/core/theme.dart';
import 'package:ecommerce_app/core/utils/text_utils.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/custom_cart_total.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_cart_container.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
            onPressed: () {},
            icon: Icon(Icons.backspace),
            color: Colors.white,
          )
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.1),
            child: ListView.separated(
              itemCount: 3,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 5,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return CustomCartContainer();
              },
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 8,
            child: CustomCartTotal(),
          )
        ],
      ),
    );
  }
}
