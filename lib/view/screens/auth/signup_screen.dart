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
  final authcontroller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Get.isDarkMode?darkGreyClr:Colors.white,
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
                        color: Get.isDarkMode?pinkClr:mainColor,
                        fontsize: 40,
                        fontWeight: FontWeight.bold, 
                        textdecoration: TextDecoration.none,
                        textAlign: TextAlign.start
                        ),
                        textUtils(
                        text: 'UP', 
                        color: Get.isDarkMode?Colors.white:Colors.black, 
                        fontsize: 40,
                        fontWeight: FontWeight.bold, 
                        textdecoration: TextDecoration.none,
                        textAlign: TextAlign.start
                        ),
                    ],
                  ),
                ),
                SizedBox(height: h*0.12,),
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
                    labelcolor: Get.isDarkMode?pinkClr:mainColor,
                    inputtextcolor: Colors.black,
                    maxlines: 1,
                    ifobscure: false,
                    prifixicon: Icon(Icons.person,color: Get.isDarkMode?pinkClr:mainColor,size: 30,), 
                    sufixicon: Container(width: 0,),
                    ontab: (){}, 
                    cursorColor: Get.isDarkMode?pinkClr:mainColor,
                    backgrouncolor: Colors.grey.shade300,
                    borderraduis: 15,
                    bordercolor: Colors.grey.shade300,
                    focusbordercolor: Get.isDarkMode?pinkClr:mainColor,
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
                    labelcolor: Get.isDarkMode?pinkClr:mainColor,
                    inputtextcolor: Colors.black,
                    maxlines: 1,
                    ifobscure: false,
                    prifixicon: Icon(Icons.email,color: Get.isDarkMode?pinkClr:mainColor,size: 30,), 
                    sufixicon: Container(width: 0,),
                    ontab: (){}, 
                    cursorColor: Get.isDarkMode?pinkClr:mainColor,
                    backgrouncolor: Colors.grey.shade300,
                    borderraduis: 15,
                    bordercolor: Colors.grey.shade300,
                    focusbordercolor: Get.isDarkMode?pinkClr:mainColor,
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
                          labelcolor: Get.isDarkMode?pinkClr:mainColor,
                          inputtextcolor: Colors.black,
                          maxlines: 1,
                          ifobscure: authcontroller.isvisibilty,
                          prifixicon: Icon(Icons.lock,color: Get.isDarkMode?pinkClr:mainColor,), 
                          sufixicon: IconButton(
                            onPressed: (){
                              authcontroller.visibilty();
                            },
                            icon: authcontroller.isvisibilty?
                             Icon(Icons.visibility_off, color: Colors.grey.shade700):
                             Icon(Icons.visibility, color: Colors.grey.shade700)
                            ),
                          ontab: (){}, 
                          cursorColor: Get.isDarkMode?pinkClr:mainColor,
                          backgrouncolor: Colors.grey.shade300,
                          borderraduis: 15,
                          bordercolor: Colors.grey.shade300,
                          focusbordercolor: Get.isDarkMode?pinkClr:mainColor,
                          ),
                      );
                  }
                  ),
                SizedBox(height: h*0.05,),
                 //check box
                GetBuilder<AuthController>(
                  builder:(_){
                  return  Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (){
                              authcontroller.checked();
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: authcontroller.ischecked?
                              Get.isDarkMode?
                               Image.asset('assets/images/check.png'):
                               const Icon(Icons.done,color: pinkClr,):
                               Container(),
                              ),
                            ),
                          const SizedBox(width: 20,),
                          textUtils(
                            text: 'I accept terms & conditions', 
                            color: Get.isDarkMode?Colors.white:Colors.black, 
                            fontsize: 15,
                            fontWeight: FontWeight.bold, 
                            textdecoration: TextDecoration.none,
                            textAlign: TextAlign.start
                            ),
                        ],
                      ),
                    );
                  }
                  ),
                SizedBox(height: h*0.05,),
                //sign up buttom
                GetBuilder<AuthController>(
                  builder: (_){
                    return Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: buttomUtils(
                           ontab: ()async{
                             if(formKey.currentState!.validate()){
                               if(authcontroller.ischecked==true){
                                 authcontroller.signUpUsingFirebase(
                                 name: userkey.text.toString(), 
                                 email: emailkey.text, 
                                 password: passwordkey.text,
                                 );
                                 
                               }
                               else{
                                Get.snackbar(
                                  'Check Box', 
                                  'please, accept terms & condition',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.green,
                                  colorText: Colors.white,
                                  );
                            }
                             }
                            
                            }, 
                           childtext: textUtils(
                             text: 'SIGN UP', 
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
                SizedBox(height:h*0.15,),
                Container(
                  width: double.infinity,
                  height: 115,
                  decoration:  BoxDecoration(
                    color: Get.isDarkMode?pinkClr:mainColor,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
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
                        textAlign: TextAlign.start
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
                              textAlign: TextAlign.start
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