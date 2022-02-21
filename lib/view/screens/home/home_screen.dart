import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/screens/home/card_items.dart';
import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:e_commerce_app/view/widgets/textformfeild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({ Key? key }) : super(key: key);
  final TextEditingController searchkey = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: h*0.3,
          decoration: BoxDecoration(
            color: Get.isDarkMode?pinkClr:mainColor,
            borderRadius: const BorderRadius.only(bottomLeft:Radius.circular(20) ,bottomRight:Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textUtils(
                text: 'Find your', 
                color: Get.isDarkMode?Colors.black:Colors.white, 
                fontsize: 23, 
                fontWeight: FontWeight.normal, 
                textdecoration: TextDecoration.none, 
                textAlign: TextAlign.start,
                ),
                textUtils(
                text: 'INSPIRATION', 
                color: Get.isDarkMode?Colors.black:Colors.white, 
                fontsize: 25, 
                fontWeight: FontWeight.bold, 
                textdecoration: TextDecoration.none, 
                textAlign: TextAlign.start,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50,top: 50,),
                  child: defualTextFormFeild(
                      controller: searchkey, 
                      inputtype: TextInputType.text, 
                      validate: null,
                      label: '',
                      labelcolor: Get.isDarkMode?pinkClr:mainColor,
                      inputtextcolor: Colors.black,
                      maxlines: 1,
                      ifobscure: false,
                      prifixicon: Icon(Icons.search,color: Get.isDarkMode?pinkClr:mainColor,size: 25,), 
                      sufixicon: Container(width: 0,),
                      ontab: (){}, 
                      cursorColor:Get.isDarkMode?pinkClr:mainColor,
                      backgrouncolor: Colors.grey.shade300,
                      borderraduis: 15,
                      bordercolor: Colors.grey.shade300,
                      focusbordercolor: Get.isDarkMode?pinkClr:mainColor,
                      hint: 'Search',
                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                      ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20,top: 10),
          child: textUtils(
                text: 'Categories', 
                color: Get.isDarkMode?Colors.white:Colors.black, 
                fontsize: 20, 
                fontWeight: FontWeight.bold, 
                textdecoration: TextDecoration.none, 
                textAlign: TextAlign.start,
                ),
        ),
        CardItems(),
      ],
    );
    
  }
}