import 'package:e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:e_commerce_app/utils/my_string.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/button_utils.dart';
import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:e_commerce_app/view/widgets/textformfeild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassScreen extends StatelessWidget {
  ForgotPassScreen({ Key? key }) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailkey = TextEditingController();
  final authcontroller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode?darkGreyClr:Colors.white,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode?darkGreyClr:Colors.white,
          title: textUtils(
            text: 'Forgot Password', 
            color: Get.isDarkMode?pinkClr:mainColor,
            fontsize: 20, 
            fontWeight: FontWeight.bold, 
            textdecoration: TextDecoration.none,
            textAlign: TextAlign.start
            ),
            centerTitle: true,
            elevation: 2,
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 5,left: 5,bottom: 20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        
                        onPressed: (){
                            Get.back();
                        }, 
                        icon: Icon(Icons.close_rounded,color: Get.isDarkMode?Colors.white:darkGreyClr,),
                        ),
                    ],
                  ),
                  textUtils(
                    text: 'if you want to recover your account, then please provide your Email below..', 
                    color: Get.isDarkMode?Colors.white:Colors.black,
                    fontsize: 15, 
                    fontWeight: FontWeight.bold, 
                    textdecoration: TextDecoration.none,
                    textAlign: TextAlign.center
                  ),
                  //image
                  Padding(
                    padding: const EdgeInsets.only(top: 30,bottom: 90),
                    child: Container(
                      width: double.infinity,
                      height: 250,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/forgetpass copy.png'),
                          fit: BoxFit.contain,
                          ),
                      ),
                    ),
                  ),
                  //insert email
                  Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: defualTextFormFeild(
                        controller: emailkey, 
                        inputtype: TextInputType.emailAddress, 
                        validate: (value){
                          if(value.isEmpty){
                            return 'plz insert the email';
                          }
                          else if(!RegExp(validationEmail).hasMatch(value)){
                            return 'plz insert valid email';
                          }
                        }, 
                        label: 'Email',
                        labelcolor: Get.isDarkMode?pinkClr:mainColor,
                        inputtextcolor: Colors.black,
                        maxlines: 1,
                        ifobscure: false,
                        prifixicon: Icon(Icons.email,color: Get.isDarkMode?pinkClr:mainColor,), 
                        sufixicon: Container(width: 0,),
                        ontab: (){}, 
                        cursorColor: Get.isDarkMode?pinkClr:mainColor,
                        backgrouncolor: Colors.grey.shade300,
                        borderraduis: 15,
                        bordercolor: Colors.grey.shade300,
                        focusbordercolor: Get.isDarkMode?pinkClr:mainColor,
                        ),
                    ),
                    SizedBox(height: h*0.07,),
                    //send BUTTOM
                    GetBuilder<AuthController>(
                      builder:(_){
                        return Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20),
                            child: SizedBox(
                              width: double.infinity,
                              child: buttomUtils(
                                    ontab: (){
                                      if(formKey.currentState!.validate()){
                                        authcontroller.resetPassword(email: emailkey.text);
                                      }
                                    }, 
                                    childtext: textUtils(
                                      text: 'SEND', 
                                      color: Colors.white, 
                                      fontsize: 20, 
                                      fontWeight: FontWeight.bold,
                                      textdecoration: TextDecoration.none,
                                      textAlign: TextAlign.start
                                      ),
                                    maincolor: Get.isDarkMode?pinkClr:mainColor, 
                                    radius: 10, 
                                    leftpadding: 0, 
                                    rightpadding: 0, 
                                    toppadding: 15, 
                                    buttompadding: 15,
                                  ),
                            ),
                          );
                      }
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}