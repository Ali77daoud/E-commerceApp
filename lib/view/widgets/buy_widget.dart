import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button_utils.dart';

class BuyWidget extends StatelessWidget {
  final String firstText;
  final String price;
  var ontab;
  final String buttonText;
  BuyWidget({
    required this.firstText,
    required this.price,
    required this.ontab,
    required this.buttonText,
     Key? key 
     }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
            height:80,
            color: Get.isDarkMode?Colors.black:Colors.white, 
      child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(firstText,style: TextStyle(
                            color:  Get.isDarkMode?Colors.white:Colors.black,
                            fontSize: 18,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          ),
                          Text('$price\$',style: TextStyle(
                            color:  Get.isDarkMode?Colors.white:Colors.black,
                            fontSize: 25,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.normal,
                          ),
                          maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        width: double.infinity,
                        child: buttomUtils(
                          ontab: ontab, 
                          childtext: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              textUtils(
                                text: buttonText, 
                                color: Colors.white, 
                                fontsize: 22, 
                                fontWeight: FontWeight.bold, 
                                textdecoration: TextDecoration.none, 
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(width: 10,),
                              const Icon(Icons.shopping_cart_outlined),
                            ],
                          ), 
                          maincolor: Get.isDarkMode?pinkClr:mainColor, 
                          radius: 15, 
                          leftpadding: 0, 
                          rightpadding: 0, 
                          toppadding: 15, 
                          buttompadding: 15
                          ),
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}