import 'package:e_commerce_app/logic/controllers/product_controller.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/card_utils.dart';
import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardItems extends StatelessWidget {
  CardItems({ Key? key }) : super(key: key);
  final productcontroller = Get.find<ProductController>();
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
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
              child: GridView.builder(
                itemCount: productcontroller.productList.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 9.0,
                  crossAxisSpacing: 6.0,
                  maxCrossAxisExtent: 200,
                ), 
                itemBuilder: (context,index){
                  return cardUtils(
                    color: Get.isDarkMode?Colors.grey.shade400:Colors.grey.shade100,
                    elevation: 10,
                    radius: 20,
                    lefticon: InkWell(
                      onTap: (){

                      },
                      child: const Icon(Icons.favorite_border_outlined,color:Colors.black,),
                      ),
                    centertext: textUtils(
                        text: 'Categories', 
                        color: Colors.black, 
                        fontsize: 12, 
                        fontWeight: FontWeight.normal, 
                        textdecoration: TextDecoration.none, 
                        textAlign: TextAlign.start,
                        ),
                    righticon: InkWell(
                      onTap: (){
                        
                      },
                      child: const Icon(Icons.add,color:Colors.black,)
                      ),
                    img: productcontroller.productList[index].image,
                    price: productcontroller.productList[index].price,
                    rate: productcontroller.productList[index].rating.rate,
                    );
                },
                ),
            ),
          );
    }
    );
  }
}