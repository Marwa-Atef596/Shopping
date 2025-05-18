import '../../logic/controller/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import '../../../../core/routing/app_router.dart';
import '../../../../core/theme.dart';
import '../../logic/controller/cart_controller.dart';
import 'custom_container_item.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({super.key, required this.title});
  final cartController = Get.find<CartController>();
  final controller = Get.find<CategoryController>();
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            Obx(() {
              return badges.Badge(
                position: badges.BadgePosition.topEnd(top: 0, end: 3),
                badgeAnimation: badges.BadgeAnimation.slide(
                  disappearanceFadeAnimationDuration:
                      Duration(milliseconds: 200),
                  curve: Curves.easeInCubic,
                ),
                //showBadge: _showCartBadge,
                badgeStyle: badges.BadgeStyle(
                  badgeColor: Colors.red,
                ),
                badgeContent: Text(
                  cartController.quantety().toString(),
                  style: TextStyle(color: Colors.white),
                ),
                child: IconButton(
                  onPressed: () {
                    Get.toNamed(Routs.cartScreen);
                  },
                  icon: Image.asset('assets/images/shop.png'),
                ),
              );
            })
          ],
          title: Text(
            title,
            //  controller.title[controller.currentIndex.value],
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Get.isDarkMode ? Colors.black : mainColor,
        ),
        body: Obx(() {
          if (controller.allCategoryLoading.value) {
            return CircularProgressIndicator(
              color: mainColor,
            );
          } else {
            return Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: controller.allCategoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomContainerItem(
                    productModel: controller.allCategoryList[index],
                  );
                },
              ),
            );
          }
        }));
  }
}
