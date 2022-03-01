import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/button_utils.dart';
import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyCart extends StatefulWidget {
  const EmptyCart({ Key? key }) : super(key: key);

  @override
  _EmptyCartState createState() => _EmptyCartState();
}

class _EmptyCartState extends State<EmptyCart> {
  @override
  Widget build(BuildContext context) {
    return 
     Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child:Icon(Icons.shopping_cart_rounded,
            color: Get.isDarkMode?Colors.white:Colors.black,
            size: 100,)
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textUtils(
                  text: 'Your cart is ', 
                  color: Get.isDarkMode?Colors.white:Colors.black, 
                  fontsize: 23, 
                  fontWeight: FontWeight.bold, 
                  textdecoration: TextDecoration.none, 
                  textAlign: TextAlign.start,
                  ),
                  textUtils(
                  text: 'Empty', 
                  color: Get.isDarkMode?pinkClr:mainColor, 
                  fontsize: 27, 
                  fontWeight: FontWeight.bold, 
                  textdecoration: TextDecoration.none, 
                  textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            textUtils(
                text: 'add items to get started', 
                color: Get.isDarkMode?Colors.white:Colors.black, 
                fontsize: 15, 
                fontWeight: FontWeight.normal, 
                textdecoration: TextDecoration.none, 
                textAlign: TextAlign.start,
              ),
            Padding(
              padding: const EdgeInsets.only(top: 80,left: 40,right: 40),
              child: SizedBox(
                width: double.infinity,
                child: buttomUtils(
                  ontab: (){
                    Get.toNamed(Routes.mainScreen);
                  }, 
                  childtext: textUtils(
                    text: 'Go to home', 
                    color: Colors.white, 
                    fontsize: 18, 
                    fontWeight: FontWeight.bold, 
                    textdecoration: TextDecoration.none, 
                    textAlign: TextAlign.start,
                  ), 
                  maincolor: Get.isDarkMode?pinkClr:mainColor, 
                  radius: 15, 
                  leftpadding: 0, 
                  rightpadding: 0, 
                  toppadding: 15, 
                  buttompadding: 15
                  ),
              ),
            ),
          ],
        ),
      );
  }
}