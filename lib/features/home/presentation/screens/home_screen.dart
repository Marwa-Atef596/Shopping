import 'package:ecommerce_app/core/theme.dart';
import 'package:ecommerce_app/core/utils/text_utils.dart';
import 'package:ecommerce_app/features/authentecation/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return CustomContainerItem();
            },
          ),
        ),
      ],
    ));
  }
}

class CustomContainerItem extends StatelessWidget {
  const CustomContainerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(16), boxShadow: [
        BoxShadow(
          color: Colors.grey.withValues(alpha: .15),
          blurRadius: 5,
          spreadRadius: 3,
        )
      ]),
      child: CustomItem(),
    );
  }
}

class CustomItem extends StatelessWidget {
  const CustomItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_outline,
              ),
            ),
            TextUtils(
                text: 'text',
                fontSize: 18,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.normal),
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
                  image: NetworkImage(
                    'https://plus.unsplash.com/premium_photo-1672363353911-debc1fc593cb?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ),
                  fit: BoxFit.cover),
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
                            text: 'text',
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            color: Colors.black,
                          ),
                        ),
                        TextUtils(
                            text: 'text',
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
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
