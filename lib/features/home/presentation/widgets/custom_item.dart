import 'package:ecommerce_app/features/home/data/model/product_model/product_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/text_utils.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_outline,
              ),
            ),
            // Text(
            //   productModel.title ?? '',
            //   style: TextStyle(
            //       color: Get.isDarkMode ? Colors.white : Colors.black,
            //       overflow: TextOverflow.ellipsis),
            // ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: Container(
            width: double.infinity,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
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
                            text:
                                '\$${productModel.price!.toStringAsFixed(2) ?? '0.00'}',
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
