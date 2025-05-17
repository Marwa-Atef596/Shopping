import '../../../../core/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controller/product_controller.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({
    super.key,
  });
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.favoriteList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/heart.png',
                  width: MediaQuery.of(context).size.width * .3,
                ),
                SizedBox(
                  height: 20,
                ),
                TextUtils(
                  text: 'Please,Add your Favorite Product',
                  fontSize: 18,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                )
              ],
            ),
          );
        } else {
          return ListView.separated(
            itemCount: controller.favoriteList.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              final productModel = controller.favoriteList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      productModel.image ??
                          'https://images.unsplash.com/photo-1746433780060-986b6ff8287a?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      width: 60,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),

                  //  Container(
                  //   width: MediaQuery.of(context).size.width * .25,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(16),
                  //     image: DecorationImage(
                  //         image: NetworkImage(
                  //           productModel.image ??
                  //               'https://images.unsplash.com/photo-1746433780060-986b6ff8287a?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  //         ),
                  //         fit: BoxFit.contain),
                  //   ),
                  // ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: IconButton(
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
                  ),
                  title: Text(
                    productModel.title ?? '',
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  subtitle: Text('\$${productModel.price!.toStringAsFixed(2)}'),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
