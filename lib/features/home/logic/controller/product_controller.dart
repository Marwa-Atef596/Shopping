import 'package:ecommerce_app/features/home/data/api/api_services.dart';
import 'package:ecommerce_app/features/home/data/model/product_model/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  void getProducts() async {
    var products = await ApiServices.getProduct();

    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}
