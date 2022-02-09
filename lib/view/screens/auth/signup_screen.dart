import 'package:e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/utils/my_string.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/button_utils.dart';
import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:e_commerce_app/view/widgets/textformfeild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({ Key? key }) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final TextEditingController userkey = TextEditingController();
  final TextEditingController emailkey = TextEditingController();
  final TextEditingController passwordkey = TextEditingController();
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode?Colors.white:darkGreyClr,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40,left: 20),
                  //sign up text
                  child: Row(
                    children: [
                      textUtils(
                        text: 'SIGN ', 
                        color: Get.isDarkMode?mainColor:pinkClr, 
                        fontsize: 40,
                        fontWeight: FontWeight.bold, 
                        textdecoration: TextDecoration.none,
                        ),
                        textUtils(
                        text: 'UP', 
                        color: Get.isDarkMode?Colors.black:Colors.white, 
                        fontsize: 40,
                        fontWeight: FontWeight.bold, 
                        textdecoration: TextDecoration.none,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 80,),
                //insert username 
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: defualTextFormFeild(
                    controller: userkey, 
                    inputtype: TextInputType.text, 
                    validate: (value){
                      if(value.isEmpty){
                        return 'plz insert the username';
                      }
                      else if(!RegExp(validationName).hasMatch(value)){
                        return 'plz insert valid username';
                      }
                    }, 
                    label: 'User Name',
                    labelcolor: Get.isDarkMode?mainColor:pinkClr,
                    inputtextcolor: Colors.black,
                    maxlines: 1,
                    ifobscure: false,
                    prifixicon: Icon(Icons.person,color: Get.isDarkMode?mainColor:pinkClr,size: 30,), 
                    sufixicon: Container(),
                    ontab: (){}, 
                    cursorColor: Get.isDarkMode?mainColor:pinkClr,
                    backgrouncolor: Colors.grey.shade300,
                    borderraduis: 15,
                    bordercolor: Colors.grey.shade300,
                    focusbordercolor: Get.isDarkMode?mainColor:pinkClr,
                    ),
                ),
                //insert email
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: defualTextFormFeild(
                    controller: emailkey, 
                    inputtype: TextInputType.text, 
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
                    prifixicon: Icon(Icons.email,color: Get.isDarkMode?mainColor:pinkClr,size: 30,), 
                    sufixicon: Container(),
                    ontab: (){}, 
                    cursorColor: Get.isDarkMode?mainColor:pinkClr,
                    backgrouncolor: Colors.grey.shade300,
                    borderraduis: 15,
                    bordercolor: Colors.grey.shade300,
                    focusbordercolor: Get.isDarkMode?mainColor:pinkClr,
                    ),
                ),
                const SizedBox(height: 20,),
                //insert password
                GetBuilder<AuthController>(
                  builder: (_){
                    return Padding(
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
                          ifobscure: controller.isvisibilty,
                          prifixicon: Icon(Icons.lock,color: Get.isDarkMode?mainColor:pinkClr,), 
                          sufixicon: IconButton(
                            onPressed: (){
                              controller.visibilty();
                            },
                            icon: controller.isvisibilty?
                             Icon(Icons.visibility_off, color: Colors.grey.shade700):
                             Icon(Icons.visibility, color: Colors.grey.shade700)
                            ),
                          ontab: (){}, 
                          cursorColor: Get.isDarkMode?mainColor:pinkClr,
                          backgrouncolor: Colors.grey.shade300,
                          borderraduis: 15,
                          bordercolor: Colors.grey.shade300,
                          focusbordercolor: Get.isDarkMode?mainColor:pinkClr,
                          ),
                      );
                  }
                  ),
                const SizedBox(height: 30,),
                 //check box
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: (){
          
                        },
                        child: 
                          Get.isDarkMode?Image.asset('assets/images/check.png'):
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Icon(Icons.check_circle_outline,color: pinkClr,)
                            ),
                        ),
                      const SizedBox(width: 20,),
                      textUtils(
                        text: 'I accept terms & conditions', 
                        color: Get.isDarkMode?Colors.black:Colors.white, 
                        fontsize: 15,
                        fontWeight: FontWeight.bold, 
                        textdecoration: TextDecoration.none,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 50,),
                //sign up buttom
                buttomUtils(
                       ontab: (){
                         if(formKey.currentState!.validate()){
                           print('ali');
                         }
                       }, 
                       childtext: textUtils(
                         text: 'SIGN UP', 
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
                const SizedBox(height: 80,),
                Container(
                  width: double.infinity,
                  height: 115,
                  decoration:  BoxDecoration(
                    color: Get.isDarkMode?mainColor:pinkClr,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                  ),
                  child: Row(
                    mainAxisAlignment:  MainAxisAlignment.center,
                    children: [
                      textUtils(
                        text: 'Already have an account?', 
                        color: Colors.white, 
                        fontsize: 15,
                        fontWeight: FontWeight.bold, 
                        textdecoration: TextDecoration.none,
                        ),
                        TextButton(
                          onPressed: (){
                            Get.offNamed(Routes.loginScreen);
                          }, 
                          child: textUtils(
                              text: 'Log in', 
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