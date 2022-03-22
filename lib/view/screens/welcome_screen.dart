import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/button_utils.dart';
import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          
          builder: (context,constraints){
          if(constraints.maxWidth<568){
            return Stack(
            children:
            [
              Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background1.jpg',),
                  fit: BoxFit.cover
                )
              ),
            ),
             Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black.withOpacity(0.3),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 180,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: textUtils(
                            text: 'Welcome', 
                            color: Colors.white, 
                            fontsize: 35, 
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                            textdecoration: TextDecoration.none
                            ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        width: 230,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.4),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            textUtils(
                              text: 'My  ', 
                              color: mainColor, 
                              fontsize: 40, 
                              fontWeight: FontWeight.bold,
                              textdecoration: TextDecoration.none,
                              textAlign: TextAlign.start
                              ),
                             textUtils(
                              text: 'Shop', 
                              color: Colors.white, 
                              fontsize: 40, 
                              fontWeight: FontWeight.bold,
                              textdecoration: TextDecoration.none,
                              textAlign: TextAlign.start
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 150,
                        ),
                     buttomUtils(
                       ontab: (){
                         Get.offNamed(Routes.loginScreen);
                       }, 
                       childtext: textUtils(
                         text: 'Get Started', 
                         color: Colors.white, 
                         fontsize: 25, 
                         fontWeight: FontWeight.bold,
                         textdecoration: TextDecoration.none,
                         textAlign: TextAlign.start
                         ),
                       maincolor: mainColor, 
                       radius: 10, 
                       leftpadding: 40, 
                       rightpadding: 40, 
                       toppadding: 15, 
                       buttompadding: 15,
                       ),
                       const SizedBox(
                        height: 60,
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textUtils(
                            text: 'dont have an Account?', 
                            color: Colors.white, 
                            fontsize: 15, 
                            fontWeight: FontWeight.normal,
                            textdecoration: TextDecoration.none,
                            textAlign: TextAlign.start
                            ),
                            TextButton(
                              onPressed:(){
                                Get.offNamed(Routes.signupScreen);
                              }, 
                              child:textUtils(
                                text: 'Sign Up', 
                                color: mainColor, 
                                fontsize: 15, 
                                fontWeight: FontWeight.normal,
                                textdecoration: TextDecoration.underline,
                                textAlign: TextAlign.start
                                ),
                             ),
                        ],
                      )
                ],
              ),
                  ),
                )
            ]
          );
          }
          else{
            return 
            Row(
              children: [
                
                Expanded(
                  flex: 2,
                  child: Container(
                  decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background1.jpg',),
                    fit: BoxFit.cover
                  )
                              ),
                            ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 170,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                        padding: const EdgeInsets.all(8),
                         child: textUtils(
                              text: 'Welcome', 
                              color: Colors.white, 
                              fontsize: 35, 
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.start,
                              textdecoration: TextDecoration.none
                              ),
                        )
                      
                      ),
                    const SizedBox(height: 10,),
                    Container(
                        width: 270,
                     
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            textUtils(
                              text: 'My  ', 
                              color: mainColor, 
                              fontsize: 40, 
                              fontWeight: FontWeight.bold,
                              textdecoration: TextDecoration.none,
                              textAlign: TextAlign.start
                              ),
                              textUtils(
                              text: 'Shop', 
                              color: Colors.white, 
                              fontsize: 40, 
                              fontWeight: FontWeight.bold,
                              textdecoration: TextDecoration.none,
                              textAlign: TextAlign.start
                              ),
                          ],
                          ),
                    ),
                    const SizedBox(
                        height: 30,
                        ),
                     buttomUtils(
                       ontab: (){
                         Get.offNamed(Routes.loginScreen);
                       }, 
                       childtext: textUtils(
                         text: 'Get Started', 
                         color: Colors.white, 
                         fontsize: 25, 
                         fontWeight: FontWeight.bold,
                         textdecoration: TextDecoration.none,
                         textAlign: TextAlign.start
                         ),
                       maincolor: mainColor, 
                       radius: 10, 
                       leftpadding: 40, 
                       rightpadding: 40, 
                       toppadding: 15, 
                       buttompadding: 15,
                       ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textUtils(
                            text: 'dont have an Account?', 
                            color: Colors.black, 
                            fontsize: 15, 
                            fontWeight: FontWeight.normal,
                            textdecoration: TextDecoration.none,
                            textAlign: TextAlign.start
                            ),
                            TextButton(
                              onPressed:(){
                                Get.offNamed(Routes.signupScreen);
                              }, 
                              child:textUtils(
                                text: 'Sign Up', 
                                color: mainColor, 
                                fontsize: 15, 
                                fontWeight: FontWeight.normal,
                                textdecoration: TextDecoration.underline,
                                textAlign: TextAlign.start
                                ),
                             ),
                        ],
                      )
                    ],
                  ),
                ),
                
                
              ],
            );
          
          }
        }
        )
      ),
    );
  }
}