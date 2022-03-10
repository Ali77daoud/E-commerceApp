import 'package:e_commerce_app/logic/controllers/cart_controller.dart';
import 'package:e_commerce_app/logic/controllers/product_controller.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/screens/product_details.dart';
import 'package:e_commerce_app/view/widgets/home_card.dart';
import 'package:e_commerce_app/view/widgets/not_found.dart';
import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardItems extends StatelessWidget {
  CardItems({ Key? key }) : super(key: key);
  final productcontroller = Get.find<ProductController>();
  final cartcontroller = Get.find<CartController>();
  final keyrefresh = GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return productcontroller.isLoading.value?
      Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Center(child:CircularProgressIndicator(
          color:Get.isDarkMode?pinkClr:mainColor,
          )
          ),
      ):
       Expanded(
         child: productcontroller.searchList.isEmpty && productcontroller.searchkey.text.isNotEmpty?
          Get.isDarkMode?
          Image.asset('assets/images/search_empty_dark.png'):
          Image.asset('assets/images/search_empry_light.png'):
          RefreshIndicator(
           key: keyrefresh,
           triggerMode: RefreshIndicatorTriggerMode.anywhere,
           color: Get.isDarkMode?pinkClr:mainColor,
           onRefresh: ()async{
             await productcontroller.getProduct();
           },
           child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 5),
                child:
                 productcontroller.productList.isEmpty?
                 ListView.builder(
                   physics: const AlwaysScrollableScrollPhysics(),
                   itemBuilder: (context,index){
                     return Padding(
                       padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.15),
                       child: const NotFound(),
                     );
                   },
                   itemCount: 1,
                   ):
                 GridView.builder(
                  itemCount:
                  productcontroller.searchList.isEmpty?
                  productcontroller.productList.length:
                  productcontroller.searchList.length ,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 9.0,
                    crossAxisSpacing: 6.0,
                    maxCrossAxisExtent: 200,
                  ), 
                  itemBuilder: (context,index){
                    return 
                    //search empty//////////////////////////////////////////////////////////
                    productcontroller.searchList.isEmpty ? InkWell(
                      onTap: (){
                        Get.to(()=>ProductDetails(
                          productModel: productcontroller.productList[index] ,
                          ));
                      },
                      child: homeCard(
                        color: Get.isDarkMode?Colors.grey.shade400:Colors.grey.shade100,
                        elevation: 10,
                        radius: 20,
                        lefticon: Obx((){
                          return InkWell(
                          onTap: (){
                            productcontroller.manageFavorite(productcontroller.productList[index].id);
                          },
                          child: productcontroller.ifFavorite(productcontroller.productList[index].id)? 
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
                            cartcontroller.addOneProduct(productcontroller.productList[index]);
                          },
                          child: Icon(Icons.shopping_cart,
                           color:
                           cartcontroller.isAddedToCart(productcontroller.productList[index])?
                           Get.isDarkMode?pinkClr:mainColor:
                           Colors.black
                          )
                          );
                        }) ,
                        img: productcontroller.productList[index].image,
                        price: productcontroller.productList[index].price,
                        rate: productcontroller.productList[index].rating.rate,
                        ),
                    ) : InkWell(
                      onTap: (){
                        Get.to(()=>ProductDetails(
                          productModel: productcontroller.searchList[index] ,
                          ));
                      },
                      child: homeCard(
                        color: Get.isDarkMode?Colors.grey.shade400:Colors.grey.shade100,
                        elevation: 10,
                        radius: 20,
                        lefticon: Obx((){
                          return InkWell(
                          onTap: (){
                            productcontroller.manageFavorite(productcontroller.searchList[index].id);
                          },
                          child: productcontroller.ifFavorite(productcontroller.searchList[index].id)? 
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
                            cartcontroller.addOneProduct(productcontroller.searchList[index]);
                          },
                          child: Icon(Icons.shopping_cart,
                           color:
                           cartcontroller.isAddedToCart(productcontroller.searchList[index])?
                           Get.isDarkMode?pinkClr:mainColor:
                           Colors.black
                          )
                          );
                        }) ,
                        img: productcontroller.searchList[index].image,
                        price: productcontroller.searchList[index].price,
                        rate: productcontroller.searchList[index].rating.rate,
                        ),
                    );
                    
                  },
                  ),
              ),
         ),
       );
    }
    );
  }
}