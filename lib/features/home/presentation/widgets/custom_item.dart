import '../../data/model/product_model/product_model.dart';
import '../../logic/controller/cart_controller.dart';
import '../screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/text_utils.dart';
import '../../logic/controller/product_controller.dart';

class CustomItem extends StatelessWidget {
  CustomItem({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  controller.faveControle(productModel.id!);
                },
                icon: controller.isFavorite(productModel.id!)
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : Icon(
                        Icons.favorite_outline,
                      ),
              ),
              IconButton(
                onPressed: () {
                  cartController.increaseItem(productModel);
                },
                icon: Icon(
                  Icons.add,
                ),
              ),
            ],
          );
        }),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              Get.to(() => ProductDetails(
                    productModel: productModel,
                  ));
            },
            child: Container(
              //   width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    //colorFilter:
                    //  ColorFilter.mode(Colors.transparent, BlendMode.dstOver),
                    image: NetworkImage(
                      productModel.image ?? '',
                    ),
                    fit: BoxFit.contain),
              ),
              child: Stack(children: [
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 10,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.withValues(alpha: 0.7)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextUtils(
                            text: '\$${productModel.price!.toStringAsFixed(2)}',
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                        SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            color: Colors.black,
                          ),
                        ),
                        TextUtils(
                            text: productModel.rating!.rate.toString(),
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                        // IconButton(
                        //     onPressed: () {},
                        //     icon: Icon(
                        //       Icons.star,
                        //       size: 18,
                        //     ))
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        )
      ],
    );
  }
}
