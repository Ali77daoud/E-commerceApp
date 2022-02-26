import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/services/network/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController{
  var productList=<ProductModel>[].obs;
  var favoritesList=<ProductModel>[].obs;
  var isLoading = true.obs;
  var isFavorites =false.obs;
  var favoriteStorage = GetStorage();
  var products;

  @override
  void onInit() async{
    super.onInit();
    List? storedShopping = favoriteStorage.read<List>('favorite');
    if(storedShopping != null){
      favoritesList.value = storedShopping.map((e) => ProductModel.fromJson(e)).toList();
    }
    await getProduct();
  }

  Future<void> getProduct()async{
    try{
      await Future.delayed(const Duration(seconds: 3)).then(
        (value) async => products = await ProductService.getProduct());
        
    }catch(e){
      isLoading.value=false;
      Get.snackbar(
              'Error', 
              'Connection error...',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red.shade600,
              colorText: Colors.white,
              );
    }
    
    try{
      isLoading.value=true;
      if(products.isNotEmpty){
        productList.addAll(products);
      }
    }finally{
      isLoading.value=false;
    }
  }
  void manageFavorite(int productId)async{
    var existingIndex = favoritesList.indexWhere((element) => element.id == productId);
    //when the the product is not in the list it returns -1
    if(existingIndex >= 0){
      favoritesList.removeAt(existingIndex);
      await favoriteStorage.write('favorite', favoritesList);
    }
    else{
      favoritesList.add(productList.firstWhere((element) => element.id == productId));
      await favoriteStorage.write('favorite', favoritesList);
    }
  }
  void removeProduct(int productId)async {
    var index = favoritesList.indexWhere((element) => element.id == productId);
    favoritesList.removeAt(index);
    await favoriteStorage.write('favorite', favoritesList);
  }
  bool ifFavorite(int productid){
    return favoritesList.any((element) => element.id==productid);
  }
}