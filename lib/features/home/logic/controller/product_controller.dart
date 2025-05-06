import 'package:ecommerce_app/features/home/data/api/api_services.dart';
import 'package:ecommerce_app/features/home/data/model/product_model/product_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  var favoriteList = <ProductModel>[].obs;
  var isLoading = true.obs;
  final GetStorage storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    getProducts();
    //add list to storage
    List? favStorage = storage.read<List>('favorite');
    if (favStorage != null) {
      favoriteList =
          favStorage.map((json) => ProductModel.fromJson(json)).toList().obs;
    }
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

  void faveControle(int productId) {
    var item = favoriteList.indexWhere((element) => element.id == productId);
    if (item >= 0) {
      favoriteList.removeAt(item);
      storage.remove('favorite');
    } else {
      ProductModel favItem =
          productList.firstWhere((element) => element.id == productId);

      favoriteList.add(favItem);
      storage.write('favorite', favoriteList);
    }
  }

  bool isFavorite(int productId) {
    return favoriteList.any((element) => element.id == productId);
  }
}
