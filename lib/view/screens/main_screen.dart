import 'package:e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:e_commerce_app/logic/controllers/main_controller.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({ Key? key }) : super(key: key);

  final authcontroller = Get.find<AuthController>();
  final maincontroller = Get.find<MainScreenController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx((){
        return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            backgroundColor:Get.isDarkMode?pinkClr:mainColor,
            title: textUtils(
              text: 'My shop', 
              color: Get.isDarkMode?Colors.black:Colors.white, 
              fontsize: 25, 
              fontWeight: FontWeight.bold, 
              textdecoration: TextDecoration.none, 
              textAlign: TextAlign.start,
              ),
              centerTitle: true,
              actions: [
                 InkWell(
                   onTap: (){
                     
                   },
                   child: Image.asset('assets/images/shop.png')
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
                fixedColor: Get.isDarkMode?pinkClr:mainColor,
                currentIndex: maincontroller.i.value,
                type: BottomNavigationBarType.fixed ,
                onTap: (index){
                  maincontroller.i.value=index;
                },
              ) ,
          body: maincontroller.screens[maincontroller.i.value],
        );
      }),
      
    );
  }
}