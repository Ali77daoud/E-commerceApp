import 'package:e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:e_commerce_app/logic/controllers/theme_controller.dart';
import 'package:e_commerce_app/utils/my_string.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/card_utils.dart';
import 'package:e_commerce_app/view/widgets/general_setting_widget.dart';
import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  
  SettingScreen({ Key? key }) : super(key: key);

  final authcontroller = Get.find<AuthController>();
  bool switchValue = ThemeController().getThemeDataFromBox();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: 
        SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 5,bottom: 5),
          child:
           Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cardUtils(
                ifNetworkImage: true,
                img: authcontroller.displyUserPhoto, 
                title: authcontroller.displyName, 
                underText: authcontroller.displyEmail, 
                textcolor: Get.isDarkMode?Colors.white:Colors.black, 
                firstIcon: Container(width: 0,), 
                flex: 0, 
                secondIcon: Container(width: 0,), 
                ),
              ///////////////////////////////////////////////
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                child: textUtils(
                   text: 'General'.tr, 
                   color: Get.isDarkMode?pinkClr:mainColor, 
                   fontsize: 18, 
                   fontWeight: FontWeight.bold, 
                   textdecoration: TextDecoration.none, 
                   textAlign: TextAlign.start,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,top: 20),
                child: Column(
                  children: [
                    GeneralSetting(
                      leftPart: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.indigoAccent.shade100
                            ),
                            child: const Icon(Icons.dark_mode,color: Colors.white,size: 20,)
                            ), 
                      text: 'DarkMode'.tr, 
                      rightPart:
                       Switch(
                          inactiveTrackColor: mainColor,
                          activeColor: pinkClr,
                          value: switchValue ,
                          onChanged: (value) {
                            ThemeController().changetheme();
                            switchValue = value;
                          },
                      ),
                    
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<AuthController>(builder: (_){
                      return GeneralSetting(
                      leftPart: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red.shade500
                            ),
                            child: const Icon(Icons.language,color: Colors.white,size: 20,)
                            ), 
                      text: 'Language'.tr, 
                      rightPart: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Container(
                          padding: const EdgeInsets.only(left: 2),
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Get.isDarkMode?Colors.white:Colors.black,
                              width: 2)
                          ),
                          child:
                        
                            DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              iconSize: 18,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Get.isDarkMode?Colors.white:Colors.black,
                                ),
                              items: [
                                DropdownMenuItem(
                                  child: Text(
                                    english,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Get.isDarkMode?Colors.white:Colors.black,
                                    ),
                                  ),
                                  value: ene,
                                  ),
                                  DropdownMenuItem(
                                  child: Text(
                                    arabic,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Get.isDarkMode?Colors.white:Colors.black,
                                    ),
                                  ),
                                  value: ara,
                                  ),
                              ],
                              value: authcontroller.lanLocal,
                              onChanged: (value){
                                authcontroller.changeLanguage(value!);
                                Get.updateLocale(Locale(value));
                              },
                              ),
                          )
                          
                           
                        ),
                      ),
                      );
                    }),
                    
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: (){
                        Get.defaultDialog(
                          title: 'Log out'.tr,
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
                      child: GeneralSetting(
                        leftPart: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue.shade200
                              ),
                              child: const Icon(Icons.logout,color: Colors.white,size: 20,)
                              ), 
                        text: 'Logout'.tr, 
                        rightPart: Container(width: 0,),
                        ),
                    ),
                   
                  ],
                ),
              ),
            ],
          ),
          
              
        ),
      ),
     
      
    );
  }
}