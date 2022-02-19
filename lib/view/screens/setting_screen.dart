import 'package:e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:e_commerce_app/logic/controllers/theme_controller.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({ Key? key }) : super(key: key);

  final authcontroller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: (){
              ThemeController().changetheme();
            }, 
            child: const Text('Dark mode')
            ),
            const SizedBox(height: 20,),
            GetBuilder<AuthController>(builder: (_){
              return TextButton(
                onPressed: (){
                  Get.defaultDialog(
                    title: 'Log out',
                    titleStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    middleText: 'Do you want to logout from App ?',
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
                      Get.back();
                    },
                    onConfirm: (){
                      authcontroller.signOutFromApp();
                    }
                  );
                  
                }, 
                child: const Text('Log out')
                );
            }
            ),
        ],
      ),
    );
  }
}