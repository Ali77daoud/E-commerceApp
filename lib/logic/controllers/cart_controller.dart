import 'package:e_commerce_app/model/product_model.dart';
import 'package:get/get.dart';


class CartController extends GetxController{
  var productsMap = {}.obs;
  
  void addProductToCart(ProductModel product){
    if(productsMap.containsKey(product)){
      productsMap[product] +=1;
   }
  }

  void addOneProduct(ProductModel product){
    productsMap[product]=1;
  }

  void removeProductFromCart(ProductModel product){
    if(productsMap.containsKey(product) && productsMap[product]==1){
      productsMap.removeWhere((key, value) => key==product);
    }
    else{
      productsMap[product] -=1;
    }
  }

  void removeOneProduct(ProductModel product){
    productsMap.removeWhere((key, value) => key==product);
  }

  void clearAllProducts(){
    productsMap.clear();
  }

  bool isAddedToCart(ProductModel product){
    return productsMap.keys.any((element) => element == product);
  }

  get subTotalPrice =>
    productsMap.entries.map((e) => e.key.price*e.value).toList();
  
  get totalPrice =>
    productsMap.entries.map((e) => e.key.price*e.value).toList().reduce((value, element) => value + element).toStringAsFixed(2);
}