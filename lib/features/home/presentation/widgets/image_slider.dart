//import 'package:carousel_slider/carousel_slider.dart' as carousel;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/core/theme.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../data/model/product_model/product_model.dart';

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
  // final carousel.CarouselController carouselController =
  //     carousel.CarouselController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          //  carouselController: carouselController,
          options: CarouselOptions(
            height: 500,
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
      ],
    );
  }
}
