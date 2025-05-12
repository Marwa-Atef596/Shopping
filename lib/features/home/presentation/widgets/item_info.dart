import 'package:ecommerce_app/core/theme.dart';
import 'package:ecommerce_app/core/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../data/model/product_model/product_model.dart';
import '../../logic/controller/product_controller.dart';

class ItemInfo extends StatelessWidget {
  ItemInfo({super.key, required this.productModel});
  final ProductModel productModel;
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextUtils(
                  text: productModel.title!,
                  fontSize: 18,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Obx(() {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: .3),
                      shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () {
                      controller.faveControle(productModel.id!);
                    },
                    icon: controller.isFavorite(productModel.id!)
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 30,
                          )
                        : Icon(
                            Icons.favorite_outline,
                            size: 30,
                          ),
                  ),
                );
              }),
            ],
          ),
          Row(
            children: [
              TextUtils(
                text: productModel.rating!.rate.toString(),
                fontSize: 20,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
              RatingBar.builder(
                initialRating: productModel.rating!.rate!,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  controller.selectedRating = rating;
                },
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ReadMoreText(
            productModel.description!,
            trimMode: TrimMode.Line,
            trimLines: 3,
            textAlign: TextAlign.justify,
            colorClickableText: mainColor,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            style: TextStyle(fontSize: 16),
            moreStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
