import 'package:badges/badges.dart';
import 'package:e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:e_commerce_app/logic/controllers/cart_controller.dart';
import 'package:e_commerce_app/logic/controllers/main_controller.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({ Key? key }) : super(key: key);

  final authcontroller = Get.find<AuthController>();
  final maincontroller = Get.find<MainScreenController>();
  final cartcontroller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Get.isDarkMode?darkClr:mainColor,
      child: SafeArea(
        child: Obx((){
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: AppBar(
              elevation: 0,
              backgroundColor:Get.isDarkMode?darkClr:mainColor,
              title: textUtils(
                text: maincontroller.titles[maincontroller.i.value].tr, 
                color: Get.isDarkMode?Colors.black:Colors.white, 
                fontsize: 25, 
                fontWeight: FontWeight.bold, 
                textdecoration: TextDecoration.none, 
                textAlign: TextAlign.start,
                ),
                centerTitle: true,
                actions: [
                  Badge(
                      position: BadgePosition.topEnd(top: 0, end: 3),
                      animationDuration: const Duration(milliseconds: 300),
                      animationType: BadgeAnimationType.slide,
                      badgeContent: Text(
                        '${cartcontroller.totalCartProducts}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      child: IconButton(
                        icon: Image.asset('assets/images/shop.png'),
                      onPressed: () {
                        Get.toNamed(Routes.cartScreen);
                      }
                      ),
                    ),
                ],
            ),
            bottomNavigationBar: BottomNavigationBar(
                  items: const [
                        BottomNavigationBarItem(icon:Icon(Icons.home),label: '' ),
                        BottomNavigationBarItem(icon:Icon(Icons.category),label: '' ),
                        BottomNavigationBarItem(icon:Icon(Icons.favorite),label: '' ),
                        BottomNavigationBarItem(icon:Icon(Icons.settings),label: '' ),
                      ],
                  iconSize: 23,
                  fixedColor: Get.isDarkMode?darkClr:mainColor,
                  currentIndex: maincontroller.i.value,
                  type: BottomNavigationBarType.fixed ,
                  onTap: (index){
                    maincontroller.i.value=index;
                  },
                ) ,
            body: maincontroller.screens[maincontroller.i.value],
          );
        }),
        
      ),
    );
  }
}