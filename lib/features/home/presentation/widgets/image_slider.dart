import 'package:carousel_slider/carousel_slider.dart';
import '../../../../core/routing/app_router.dart';
import '../../../../core/theme.dart';
import 'color_picker.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:badges/badges.dart' as badges;

import '../../data/model/product_model/product_model.dart';
import '../../logic/controller/cart_controller.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final cartController = Get.find<CartController>();

  int currentPage = 0;
  int currentColor = 0;
  final List<Color> colorsList = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          options: CarouselOptions(
            height: 450,
            enlargeCenterPage: true,
            autoPlay: true,
            enableInfiniteScroll: false,
            autoPlayInterval: Duration(seconds: 2),
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                currentPage = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      widget.productModel.image!,
                    ),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(20),
              ),
            );
          },
        ),
        Positioned(
          bottom: 30,
          left: MediaQuery.of(context).size.width * .45,
          child: AnimatedSmoothIndicator(
            activeIndex: currentPage,
            count: 3,
            effect: ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: Get.isDarkMode ? Colors.black : mainColor,
            ),
          ),
        ),
        Positioned(
            bottom: 30,
            right: 30,
            child: Container(
              padding: EdgeInsets.all(8),
              height: 200,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: .2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListView.separated(
                itemCount: colorsList.length,
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentColor = index;
                      });
                    },
                    child: ColorPicker(
                      color: colorsList[index],
                      outerBorder: currentColor == index,
                    ),
                  );
                },
              ),
            )),
        Positioned(
            top: 30,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: .3),
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Get.isDarkMode ? Colors.black : mainColor,
                    ),
                  ),
                ),
                badges.Badge(
                  position: badges.BadgePosition.topEnd(top: -10, end: -8),
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
                  child: InkWell(
                    onTap: () => Get.toNamed(Routs.cartScreen),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: .2),
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Get.isDarkMode ? Colors.black : mainColor,
                      ),
                    ),
                  ),
                )
              ],
            ))
      ],
    );
  }
}
