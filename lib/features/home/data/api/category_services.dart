import '../../../../core/helpers/my_string.dart';
import '../model/category_model/category_model.dart';
import 'package:http/http.dart' as http;

import '../model/product_model/product_model.dart';

class CategoryServices {
  static Future<List<String>> getCatrgory() async {
    var response = await http.get(Uri.parse('${baseUrl}products/categories'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return categoryModelFromJson(jsonData);
    } else {
      return throw Exception('Faild Loading');
    }
  }

   static Future<List<ProductModel>> getAllCatrgory(String category) async {
    var response = await http.get(Uri.parse('${baseUrl}products/category/$category'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelFromJson(jsonData);
    } else {
      return throw Exception('Faild Loading');
    }
  }
}
