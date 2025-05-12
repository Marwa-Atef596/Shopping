import '../../../../core/theme.dart';
import '../../logic/controller/cart_controller.dart';
import '../../logic/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

import '../../../../core/routing/app_router.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final controller = Get.find<HomeController>();
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: AppBar(
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
            controller.title[controller.currentIndex.value],
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Get.isDarkMode ? Colors.black : mainColor,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          selectedItemColor: mainColor,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          ],
          onTap: (value) {
            controller.currentIndex.value = value;
          },
        ),
        body: controller.tabs[controller.currentIndex.value],
      );
    });
  }
}
