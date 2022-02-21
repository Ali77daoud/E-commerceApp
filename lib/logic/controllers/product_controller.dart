import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/services/network/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  var productList=<ProductModel>[].obs;
  var isLoading = true.obs;
  var products ;

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }

  void getProduct()async{
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
}