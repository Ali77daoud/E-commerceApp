import 'package:e_commerce_app/logic/controllers/cart_controller.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/screens/cart/empty_cart.dart';
import 'package:e_commerce_app/view/widgets/button_utils.dart';
import 'package:e_commerce_app/view/widgets/buy_widget.dart';
import 'package:e_commerce_app/view/widgets/card_utils.dart';
import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({ Key? key }) : super(key: key);
  final cartcontroller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:Get.isDarkMode?pinkClr:mainColor,
        title: textUtils(
          text: 'Cart items', 
          color: Get.isDarkMode?Colors.black:Colors.white, 
          fontsize: 25, 
          fontWeight: FontWeight.bold, 
          textdecoration: TextDecoration.none, 
          textAlign: TextAlign.start,
          ),
        actions: [
          IconButton(
            onPressed: (){
              Get.defaultDialog(
                    title: 'Delete Products',
                    titleStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    middleText: 'Do you want to delete all products ?',
                    middleTextStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    radius: 15,
                    backgroundColor: Colors.grey.shade400,
                    textCancel: 'cancel',
                    cancelTextColor: Colors.black,
                    buttonColor: Get.isDarkMode?pinkClr:mainColor,
                    textConfirm: 'ok',
                    confirmTextColor: Colors.black,
                    onCancel: (){
                      
                    },
                    onConfirm: (){
                      cartcontroller.clearAllProducts();
                      Get.back();
                    }
                  );
            }, 
            icon: const Icon(Icons.backspace),
            ),
        ],
      ),
      body: Obx((){
        if(cartcontroller.productsMap.isEmpty){
          return const EmptyCart();
        }
        else{
          return Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context,index)=>
              cardUtils(
                img: cartcontroller.productsMap.keys.toList()[index].image,
                title: cartcontroller.productsMap.keys.toList()[index].title,
                price: cartcontroller.subTotalPrice[index], 
                textcolor: Get.isDarkMode?Colors.white:Colors.black,
                firstIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){
                        cartcontroller.removeProductFromCart(cartcontroller.productsMap.keys.toList()[index]);
                      },
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color: Colors.black,
                        ),
                        child: const Icon(Icons.exposure_minus_1,color: Colors.white,size: 15,),
                      ),
                    ),
                    Text('${cartcontroller.productsMap.values.toList()[index]}'),
                    InkWell(
                      onTap: (){
                        cartcontroller.addProductToCart(cartcontroller.productsMap.keys.toList()[index]);
                      },
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color: Colors.black,
                        ),
                        child: const Icon(Icons.plus_one,color: Colors.white,size: 15,),
                      ),
                    )
                  ],
                ), 
                flex: 2, 
                secondIcon: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: IconButton(
                    onPressed: (){
                      cartcontroller.removeOneProduct(cartcontroller.productsMap.keys.toList()[index]);
                    }, 
                    icon:  Icon(Icons.delete,color: Colors.red.shade600),
                    ),
                ),
                ),
              separatorBuilder: (context,index){
                return Divider(
                  color: Get.isDarkMode?Colors.grey.shade800:Colors.grey.shade300,
                  height: 2,
                );
              },
              itemCount: cartcontroller.productsMap.length,
            ),
          ),
          BuyWidget(
            firstText: 'Total', 
            price: cartcontroller.totalPrice, 
            ontab: (){

            }, 
            buttonText: 'Buy'
            ),
        ],
            );
        }
        
      })
    );
  }
}