import 'package:http/http.dart' as http;

import '../../../../core/helpers/my_string.dart';
import '../model/product_model/product_model.dart';

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
