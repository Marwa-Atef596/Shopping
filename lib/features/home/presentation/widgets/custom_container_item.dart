import 'package:flutter/material.dart';

import '../../data/model/product_model/product_model.dart';
import 'custom_item.dart';

class CustomContainerItem extends StatelessWidget {
  const CustomContainerItem({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        //  height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: Colors.black.withValues(alpha: .2),
              style: BorderStyle.solid),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: .15),
              // color: Colors.white,
              blurRadius: 5,
              spreadRadius: 3,
              offset: Offset(4, 0),
            )
          ],
        ),
        child: CustomItem(
          productModel: productModel,
        ),
      ),
    );
  }
}
