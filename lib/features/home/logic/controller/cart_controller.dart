import '../../data/model/product_model/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var productMap = {}.obs;

  void increaseItem(ProductModel productModel) {
    if (productMap.containsKey(productModel)) {
      productMap[productModel] += 1;
    } else {
      productMap[productModel] = 1;
    }
  }

  void decreaseItem(ProductModel productModel) {
    if (productMap.containsKey(productModel) && productMap[productModel] == 1) {
      productMap.removeWhere((key, value) => key == productModel);
    } else {
      productMap[productModel] -= 1;
    }
  }

  void removeItem(ProductModel productModel) {
    productMap.removeWhere((key, value) => key == productModel);
  }

  void cleareAllItems() {
    productMap.clear();
  }

  get subTotal => productMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((v, e) => v + e)
      .toString();

  int quantety() {
    if (productMap.isEmpty) {
      return 0;
    } else {
      return productMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((e, v) => e + v);
    }
  }
}
