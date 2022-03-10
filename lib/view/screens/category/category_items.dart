import 'package:e_commerce_app/logic/controllers/cart_controller.dart';
import 'package:e_commerce_app/logic/controllers/category_controller.dart';
import 'package:e_commerce_app/logic/controllers/product_controller.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/home_card.dart';
import 'package:e_commerce_app/view/widgets/not_found.dart';
import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class CategoryItems extends StatelessWidget {
  final String categoryName;
  final int index;
  CategoryItems({
    required this.categoryName,
    required this.index,
    Key? key
      }) : super(key: key);

  final productcontroller = Get.find<ProductController>();
  final cartcontroller = Get.find<CartController>();
  final categorycontroller = Get.put(CategoryController());
  final keyrefresh = GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Get.isDarkMode?pinkClr:mainColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
              elevation: 0,
              backgroundColor:Get.isDarkMode?pinkClr:mainColor,
              title: textUtils(
                text: categoryName, 
                color: Get.isDarkMode?Colors.black:Colors.white, 
                fontsize: 25, 
                fontWeight: FontWeight.bold, 
                textdecoration: TextDecoration.none, 
                textAlign: TextAlign.start,
                ),
                centerTitle: true,
          ),
          body:
          Obx((){
            return categorycontroller.isAllLoading.value?
            Center(child:CircularProgressIndicator(
              color:Get.isDarkMode?pinkClr:mainColor,
              )
              ):
            RefreshIndicator(
              key: keyrefresh,
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              color: Get.isDarkMode?pinkClr:mainColor,
              onRefresh: ()async{
                await categorycontroller.getAllCategory(index);
              },
              child:
              categorycontroller.categoryList.isEmpty?
              ListView.builder(
                   physics: const AlwaysScrollableScrollPhysics(),
                   itemBuilder: (context,index){
                     return Padding(
                       padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.35),
                       child: const NotFound(),
                  );
                   },
                   itemCount: 1,
                   ):
              GridView.builder(
              gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
                        childAspectRatio: 0.8,
                        mainAxisSpacing: 9.0,
                        crossAxisSpacing: 6.0,
                        maxCrossAxisExtent: 200,
                      ),
              itemCount: categorycontroller.categoryList.length,
              itemBuilder: (context,index){
                return homeCard(
                            color: Get.isDarkMode?Colors.grey.shade400:Colors.grey.shade100,
                            elevation: 10,
                            radius: 20,
                            lefticon: Obx((){
                              return InkWell(
                              onTap: (){
                                productcontroller.manageFavorite(categorycontroller.categoryList[index].id);
                              },
                              child: productcontroller.ifFavorite(categorycontroller.categoryList[index].id)? 
                                const Icon(Icons.favorite,color:Colors.red,):
                                const Icon(Icons.favorite_border_outlined,color:Colors.black,)
                              );
                            }), 
                            centertext: textUtils(
                                text: 'Categories', 
                                color: Colors.black, 
                                fontsize: 12, 
                                fontWeight: FontWeight.normal, 
                                textdecoration: TextDecoration.none, 
                                textAlign: TextAlign.start,
                                ),
                            righticon:Obx((){
                              return InkWell(
                              onTap: (){
                                cartcontroller.addOneProduct(categorycontroller.categoryList[index]);
                              },
                              child: Icon(Icons.shopping_cart,
                               color:
                               cartcontroller.isAddedToCart(categorycontroller.categoryList[index])?
                               Get.isDarkMode?pinkClr:mainColor:
                               Colors.black
                              )
                              );
                            }) ,
                            img: categorycontroller.categoryList[index].image,
                            price: categorycontroller.categoryList[index].price,
                            rate: categorycontroller.categoryList[index].rating.rate,
                            );
                  }
              ),
            );
          })
           
        ),
      ),
    );
  }
}