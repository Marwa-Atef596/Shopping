
import 'package:flutter/material.dart';

import '../../data/model/product_model/product_model.dart';
import 'custom_item.dart';

class CustomContainerItem extends StatelessWidget {
  const CustomContainerItem({
    super.key, required this.productModel,
  });
 final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(16), boxShadow: [
        BoxShadow(
          color: Colors.grey.withValues(alpha: .15),
          blurRadius: 5,
          spreadRadius: 3,
        )
      ]),
      child: CustomItem(productModel: productModel,),
    );
  }
}

