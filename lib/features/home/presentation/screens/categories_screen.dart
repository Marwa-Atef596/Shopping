import '../../../../core/theme.dart';
import '../../../../core/utils/text_utils.dart';
import '../../logic/controller/category_controller.dart';
import '../widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
  final controller = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: mainColor,
          ),
        );
      } else {
        return ListView.separated(
          itemCount: controller.categoryList.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 20,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  controller.getCategoryIndex(index);
                  Get.to(() => CategoryItem(
                        title: controller.categoryList[index],
                      ));
                },
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        image: NetworkImage(controller.images[index]),
                        fit: BoxFit.contain),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black.withValues(alpha: 0.4),
                    ),
                    child: Center(
                      child: TextUtils(
                        text: controller.categoryList[index],
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }
    }));
  }
}
