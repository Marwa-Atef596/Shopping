import '../../data/api/category_services.dart';
import '../../data/model/product_model/product_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var categoryList = <String>[].obs;
  var allCategoryList = <ProductModel>[].obs;
  var isLoading = false.obs;
  var allCategoryLoading = false.obs;
  List<String> images = [
    "https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
    "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",
  ];
  @override
  void onInit() {
    super.onInit();
    getCategory();
  }

  void getCategory() async {
    var categoryName = await CategoryServices.getCatrgory();
    try {
      isLoading(true);
      if (categoryName.isNotEmpty) {
        categoryList.addAll(categoryName);
      }
    } finally {
      isLoading(false);
    }
  }

  getAllCategory(String category) async {
    allCategoryLoading(true);
    allCategoryList.value = await CategoryServices.getAllCatrgory(category);

    allCategoryLoading(false);
  }

  getCategoryIndex(int index) async {
    var categoryNames = await getAllCategory(categoryList[index]);
    if (categoryNames != null) {
      allCategoryList.value = categoryNames;
    }
  }
}
