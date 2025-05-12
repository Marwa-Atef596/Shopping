import '../../../../core/theme.dart';
import '../../logic/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_container_item.dart';

class CustomGridItem extends StatelessWidget {
  CustomGridItem({
    super.key,
  });
  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: mainColor,
          ),
        );
      } else {
        return Expanded(
          child: controller.searchList.isEmpty &&
                  controller.searchText.text.isNotEmpty
              ? Image.asset('assets/images/search_empry_light.png')
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: controller.searchList.isEmpty
                      ? controller.productList.length
                      : controller.searchList.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (controller.searchList.isEmpty) {
                      return CustomContainerItem(
                        productModel: controller.productList[index],
                      );
                    } else {
                      return CustomContainerItem(
                        productModel: controller.searchList[index],
                      );
                    }
                  },
                ),
        );
      }
    });
  }
}
