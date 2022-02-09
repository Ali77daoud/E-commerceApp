import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/utils/my_string.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/button_utils.dart';
import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:e_commerce_app/view/widgets/textformfeild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({ Key? key }) : super(key: key);

  final formKey = GlobalKey<FormState>();
  TextEditingController emailkey = TextEditingController();
  TextEditingController passwordkey = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode?Colors.white:darkGreyClr,
      body:SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40,left: 20),
                  //log in text
                  child: Row(
                    children: [
                      textUtils(
                        text: 'LOG ', 
                        color: Get.isDarkMode?mainColor:pinkClr, 
                        fontsize: 40,
                        fontWeight: FontWeight.bold, 
                        textdecoration: TextDecoration.none,
                        ),
                        textUtils(
                        text: 'IN', 
                        color: Get.isDarkMode?Colors.black:Colors.white, 
                        fontsize: 40,
                        fontWeight: FontWeight.bold, 
                        textdecoration: TextDecoration.none,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 90,),
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
                    labelcolor: Get.isDarkMode?mainColor:pinkClr,
                    inputtextcolor: Colors.black,
                    maxlines: 1,
                    ifobscure: false,
                    prifixicon: Icon(Icons.email,color: Get.isDarkMode?mainColor:pinkClr,), 
                    sufixicon: Container(),
                    ontab: (){}, 
                    cursorColor: Get.isDarkMode?mainColor:pinkClr,
                    backgrouncolor: Colors.grey.shade300,
                    borderraduis: 15,
                    bordercolor: Colors.grey.shade300,
                    focusbordercolor: Get.isDarkMode?mainColor:pinkClr,
                    ),
                ),
                const SizedBox(height: 30,),
                //insert password
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: defualTextFormFeild(
                    controller: passwordkey, 
                    inputtype: TextInputType.visiblePassword, 
                    validate: (value){
                      if(value.isEmpty){
                        return 'plz insert the password';
                      }
                      else if(value.length < 8){
                        return 'plz insert valid password with 8 char';
                      }
                    }, 
                    label: 'Password',
                    labelcolor: Get.isDarkMode?mainColor:pinkClr,
                    inputtextcolor: Colors.black,
                    maxlines: 1,
                    ifobscure: true,
                    prifixicon: Icon(Icons.lock,color: Get.isDarkMode?mainColor:pinkClr,), 
                    sufixicon: Container(),
                    ontab: (){}, 
                    cursorColor: Get.isDarkMode?mainColor:pinkClr,
                    backgrouncolor: Colors.grey.shade300,
                    borderraduis: 15,
                    bordercolor: Colors.grey.shade300,
                    focusbordercolor: Get.isDarkMode?mainColor:pinkClr,
                    ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  //forgot password
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: (){
          
                        },
                        child: textUtils(
                              text: 'Forgot Password ?', 
                              color: Colors.grey.shade600, 
                              fontsize: 15,
                              fontWeight: FontWeight.bold, 
                              textdecoration: TextDecoration.none,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40,),
                //login buttom
                buttomUtils(
                       ontab: (){
                         if(formKey.currentState!.validate()){
                           print('ali');
                         }
                       }, 
                       childtext: textUtils(
                         text: 'LOG IN', 
                         color: Colors.white, 
                         fontsize: 20, 
                         fontWeight: FontWeight.bold,
                         textdecoration: TextDecoration.none
                         ),
                       maincolor: Get.isDarkMode?mainColor:pinkClr, 
                       radius: 10, 
                       leftpadding: 120, 
                       rightpadding: 120, 
                       toppadding: 15, 
                       buttompadding: 15,
                    ),
                const SizedBox(height: 20,),
                textUtils(
                    text: 'OR', 
                    color: Colors.grey.shade600, 
                    fontsize: 20,
                    fontWeight: FontWeight.bold, 
                    textdecoration: TextDecoration.none,
                    ),
                const SizedBox(height: 30,),
                //login with 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
          
                      },
                      child: Image.asset('assets/images/facebook.png')
                      ),
                    const SizedBox(width: 20,),
                    InkWell(
                      onTap: (){
                        
                      },
                      child: Image.asset('assets/images/google.png'),
                      ),
                  ],
                ),
                const SizedBox(height: 50,),
                //dont have an account
                Container(
                  width: double.infinity,
                  height: 115,
                  decoration: BoxDecoration(
                    color: Get.isDarkMode?mainColor:pinkClr,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                  ),
                  child: Row(
                    mainAxisAlignment:  MainAxisAlignment.center,
                    children: [
                      textUtils(
                        text: 'Dont have an account?', 
                        color: Colors.white, 
                        fontsize: 15,
                        fontWeight: FontWeight.bold, 
                        textdecoration: TextDecoration.none,
                        ),
                        TextButton(
                          onPressed: (){
                            Get.offNamed(Routes.signupScreen);
                          }, 
                          child: textUtils(
                              text: 'Sign up', 
                              color: Colors.white, 
                              fontsize: 15,
                              fontWeight: FontWeight.bold, 
                              textdecoration: TextDecoration.underline,
                              ),
                              ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}