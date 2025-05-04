import 'package:ecommerce_app/core/theme.dart';
import 'package:ecommerce_app/features/home/logic/controller/home_controller.dart';
import 'package:ecommerce_app/features/home/logic/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                ThemeController().changeTheme();
              },
              icon: Image.asset('assets/images/shop.png'),
            ),
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
      );
    });
  }
}
