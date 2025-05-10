import 'package:ecommerce_app/features/home/data/model/product_model/product_model.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/image_slider.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.productModel,});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ImageSlider(
           productModel: productModel,
          
          ),
        ],
      ),
    );
  }
}
