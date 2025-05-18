import '../widgets/add_cart_button.dart';
import '../widgets/item_size.dart';

import '../../data/model/product_model/product_model.dart';
import '../widgets/image_slider.dart';
import '../widgets/item_info.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageSlider(
              productModel: productModel,
            ),
            ItemInfo(
              productModel: productModel,
            ),
            ItemSize(),
            AddCartButton(
              productModel: productModel,
            ),
          ],
        ),
      ),
    );
  }
}
