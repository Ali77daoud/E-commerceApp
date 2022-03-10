import 'package:e_commerce_app/model/category_model.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/utils/my_string.dart';
import 'package:http/http.dart' as http;

class CategoryService{

  static Future<List<String>> getCategory()async{
    var response =  await http.get(Uri.parse('$baseUrl/products/categories'));

    if(response.statusCode == 200){
      var jsonData = response.body;
      return categoryModelFromJson(jsonData);
    }
    else{
      return throw Exception('error in loading products');
    }
  }
}

class AllCategoryService{

  static Future<List<ProductModel>> getAllCategory(String categoryName)async{
    var response =  await http.get(Uri.parse('$baseUrl/products/category/$categoryName'));

    if(response.statusCode == 200){
      var jsonData = response.body;
      return productModelFromJson(jsonData);
    }
    else{
      return throw Exception('error in loading products');
    }
  }
}