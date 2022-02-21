import 'package:e_commerce_app/logic/controllers/auth_controller.dart';
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
  final TextEditingController emailkey = TextEditingController();
  final TextEditingController passwordkey = TextEditingController();
  final authcontroller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Get.isDarkMode?darkGreyClr:Colors.white,
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
                        color: Get.isDarkMode?pinkClr:mainColor,
                        fontsize: 40,
                        fontWeight: FontWeight.bold, 
                        textdecoration: TextDecoration.none,
                        textAlign: TextAlign.start
                        ),
                        textUtils(
                        text: 'IN', 
                        color: Get.isDarkMode?Colors.white:Colors.black, 
                        fontsize: 40,
                        fontWeight: FontWeight.bold, 
                        textdecoration: TextDecoration.none,
                        textAlign: TextAlign.start
                        ),
                    ],
                  ),
                ),
                SizedBox(height: h*0.1,),
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
                    cursorColor:Get.isDarkMode?pinkClr:mainColor,
                    backgrouncolor: Colors.grey.shade300,
                    borderraduis: 15,
                    bordercolor: Colors.grey.shade300,
                    focusbordercolor: Get.isDarkMode?pinkClr:mainColor,
                    ),
                ),
                const SizedBox(height: 30,),
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
                
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  //forgot password
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: (){
                          Get.toNamed(Routes.forgotpassScreen);
                        },
                        child: textUtils(
                              text: 'Forgot Password ?', 
                              color: Colors.grey.shade600, 
                              fontsize: 15,
                              fontWeight: FontWeight.bold, 
                              textdecoration: TextDecoration.none,
                              textAlign: TextAlign.start
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h*0.06,),
                //login buttom
                GetBuilder<AuthController>(
                  builder: (_){
                    return Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: SizedBox(
                        width: double.infinity,
                        child: buttomUtils(
                              ontab: (){
                                if(formKey.currentState!.validate()){
                                  authcontroller.showCircleIndecator();
                                  authcontroller.logInUsingFirebase(
                                    email: emailkey.text, 
                                    password: passwordkey.text,
                                    );
                                }
                              }, 
                              childtext: textUtils(
                                text: 'LOG IN', 
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
                SizedBox(height: h*0.02,),
                GetBuilder<AuthController>(
                  builder: (_){
                    return authcontroller.ifCircleIndicatorShown?
                    CircularProgressIndicator(color:Get.isDarkMode?pinkClr:mainColor,):
                    Container();
                    
                  }
                  ),
               
               SizedBox(height: h*0.02,),
                textUtils(
                    text: 'OR', 
                    color: Colors.grey.shade600, 
                    fontsize: 20,
                    fontWeight: FontWeight.bold, 
                    textdecoration: TextDecoration.none,
                    textAlign: TextAlign.start
                    ),
                SizedBox(height: h*0.03,),
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
                    GetBuilder<AuthController>(
                      builder: (_){
                        return InkWell(
                          onTap: (){
                           authcontroller.showCircleIndecator();
                            authcontroller.googleSignIn();
                          },
                          child: Image.asset('assets/images/google.png'),
                          );
                      }
                      ),
                    
                  ],
                ),
                SizedBox(height: h*0.1,),
                //dont have an account
                Container(
                  width: double.infinity,
                  height: 115,
                  decoration: BoxDecoration(
                    color: Get.isDarkMode?pinkClr:mainColor,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
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
                        textAlign: TextAlign.start
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