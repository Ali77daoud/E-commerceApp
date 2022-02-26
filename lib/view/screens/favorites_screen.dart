import 'package:e_commerce_app/logic/controllers/product_controller.dart';
import 'package:e_commerce_app/view/widgets/card_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({ Key? key }) : super(key: key);
  final productcontroller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(productcontroller.favoritesList.isEmpty){
        return const Center(child: Text('Empty'));
      }
      else{ 
        return ListView.separated(
        itemBuilder: (context,index)=>cardUtils(
          firstIcon: IconButton(
                    onPressed: (){
                      productcontroller.removeProduct(productcontroller.favoritesList[index].id,);
                    },
                    icon: Icon(Icons.favorite,color: Colors.red.shade600),
                    ),
          img:productcontroller.favoritesList[index].image ,
          price: productcontroller.favoritesList[index].price,
          textcolor: Get.isDarkMode?Colors.white:Colors.black,
          title: productcontroller.favoritesList[index].title,
          flex: 1,
          secondIcon: Container(),
        ),
        separatorBuilder: (context,index){
          return Divider(
            color: Get.isDarkMode?Colors.grey.shade800:Colors.grey.shade300,
            height: 2,
          );
        }, 
        itemCount: productcontroller.favoritesList.length
      );
      }
    }
    );
  }
}