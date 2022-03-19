import 'package:e_commerce_app/logic/controllers/cart_controller.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/buy_widget.dart';
import 'package:e_commerce_app/view/widgets/clothes_info.dart';
import 'package:e_commerce_app/view/widgets/clothes_size_list.dart';
import 'package:e_commerce_app/view/widgets/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel productModel;
  ProductDetails({ required this.productModel ,Key? key }) : super(key: key);
  final cartcontroller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    List<Widget> mylist =[
      ImageSlider(
                img: productModel.image,
                ),
      ClothesInfo(
                title:productModel.title ,
                productId: productModel.id,
                rate:productModel.rating.rate ,
                discription: productModel.description,
                ),
      const SizeList(),
    ];
    return Container(
      color: Get.isDarkMode?darkClr:mainColor,
      child: SafeArea(

        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context,index){
                    return mylist[index];
                  },
                  itemCount: mylist.length,
                  ),
              ),
             BuyWidget(
               firstText: 'Price', 
               price: productModel.price.toString(), 
               ontab: (){
                 cartcontroller.addOneProduct(productModel);
               }, 
               buttonText: 'Add To Cart'
               ),
            ],
          ),
        ),
      ),
    );
  }
}