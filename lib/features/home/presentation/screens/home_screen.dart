import 'package:ecommerce_app/core/theme.dart';
import 'package:ecommerce_app/core/utils/text_utils.dart';
import 'package:ecommerce_app/features/authentecation/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_grid_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
            color: Get.isDarkMode ? Colors.black : mainColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                    text: 'Find Your',
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
                TextUtils(
                    text: 'INSPIRATION',
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        obscureText: false,
                        hintText: 'Search You\'re Looking For',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.sort,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextUtils(
          text: 'Categories',
          fontSize: 22,
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 20,
        ),
        CustomGridItem(),
      ],
    ));
  }
}
