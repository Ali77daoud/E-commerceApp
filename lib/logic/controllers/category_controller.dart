import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/services/network/category_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CategoryController extends GetxController{
  var categorynameList = <String>[].obs;
  var categoryList = <ProductModel>[].obs;
  var isLoading = true.obs;
  var isAllLoading = true.obs;

  List<String> categoryImages=[
    "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg"
  ];
  
  @override
  void onInit() {
    super.onInit();
    getCategory();
  }

  Future<void> getCategory()async{
     List<String> categoryName = <String>[].obs; 
     try{
      await Future.delayed(const Duration(seconds: 3)).then((value)async {
         categoryName = await CategoryService.getCategory();
      });
     
    }catch(e){
      isAllLoading.value=false;
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
      if(categoryName.isNotEmpty){
        categorynameList.value = categoryName;
      }
    }finally{
      isLoading.value=false;
    }
  }

  Future<void> getAllCategory(int index)async{
    List<ProductModel> categoryAllList = <ProductModel>[].obs;
    try{
      isAllLoading.value=true;
      categoryAllList = await  AllCategoryService.getAllCategory(categorynameList[index]);
     
    }catch(e){
      isAllLoading.value=false;
      Get.snackbar(
              'Error', 
              'Connection error...',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red.shade600,
              colorText: Colors.white,
              );
    }
    try{
      if(categoryAllList.isNotEmpty){
        categoryList.value=categoryAllList;
      }
    }finally{
      isAllLoading.value=false;
    }
  }
}