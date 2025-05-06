import 'package:ecommerce_app/core/helpers/my_string.dart';
import 'package:ecommerce_app/features/home/data/model/product_model/product_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<ProductModel>> getProduct() async {
    var response = await http.get(Uri.parse('${baseUrl}products'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelFromJson(jsonData);
    } else {
      return throw Exception('Faild Loading');
    }
  }
}
