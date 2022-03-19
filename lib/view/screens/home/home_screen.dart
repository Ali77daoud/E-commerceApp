import 'package:e_commerce_app/logic/controllers/product_controller.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/screens/home/product_card_items.dart';
import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:e_commerce_app/view/widgets/textformfeild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({ Key? key }) : super(key: key);
  final productcontroller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return
    LayoutBuilder(builder: (context,con){
      if(con.maxWidth<500){
        return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Get.isDarkMode?darkClr:mainColor,
            borderRadius: const BorderRadius.only(bottomLeft:Radius.circular(20) ,bottomRight:Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20,top: 10,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textUtils(
                text: 'Find your'.tr, 
                color: Get.isDarkMode?Colors.black:Colors.white, 
                fontsize: 23, 
                fontWeight: FontWeight.normal, 
                textdecoration: TextDecoration.none, 
                textAlign: TextAlign.start,
                ),
                textUtils(
                text: 'INSPIRATION'.tr, 
                color: Get.isDarkMode?Colors.black:Colors.white, 
                fontsize: 25, 
                fontWeight: FontWeight.bold, 
                textdecoration: TextDecoration.none, 
                textAlign: TextAlign.start,
                ),
                GetBuilder<ProductController>(builder: (_){
                  return Padding(
                  padding: const EdgeInsets.only(right: 50,top: 50),
                  child: defualTextFormFeild(
                      onChange: (searchName){
                        productcontroller.addSearchToList(searchName);
                      },
                      controller: productcontroller.searchkey, 
                      inputtype: TextInputType.text, 
                      validate: null,
                      label: '',
                      labelcolor: Get.isDarkMode?darkClr:mainColor,
                      inputtextcolor: Colors.black,
                      maxlines: 1,
                      ifobscure: false,
                      prifixicon: Icon(Icons.search,color: Get.isDarkMode?darkClr:mainColor,size: 25,), 
                      sufixicon: productcontroller.searchkey.text.isNotEmpty? IconButton(
                        onPressed: (){
                          productcontroller.clearSearch();
                        }, 
                        icon: const Icon(Icons.clear,color: Colors.black,size: 20,),
                        ):Container(width: 0,),
                      ontab: (){}, 
                      cursorColor:Get.isDarkMode?darkClr:mainColor,
                      backgrouncolor: Colors.grey.shade300,
                      borderraduis: 15,
                      bordercolor: Colors.grey.shade300,
                      focusbordercolor: Get.isDarkMode?darkClr:mainColor,
                      hint: 'Search with name',
                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                      ),
                );
                }
                ),
                
              ],
            ),
          ),
        ),
         Padding(
                padding: const EdgeInsets.only(left: 20,top: 10,right: 20),
                child: textUtils(
                  text: 'Products'.tr, 
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
      else{
      return Padding(
        padding: const EdgeInsets.only(top: 1),
        child: Row(
          children: [
            Container(
            width: 300,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Get.isDarkMode?darkClr:mainColor,
              borderRadius: const BorderRadius.only(topRight:Radius.circular(20) ,bottomRight:Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20,top: 10,right: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textUtils(
                    text: 'Find your'.tr, 
                    color: Get.isDarkMode?Colors.black:Colors.white, 
                    fontsize: 23, 
                    fontWeight: FontWeight.normal, 
                    textdecoration: TextDecoration.none, 
                    textAlign: TextAlign.start,
                    ),
                    textUtils(
                    text: 'INSPIRATION'.tr, 
                    color: Get.isDarkMode?Colors.black:Colors.white, 
                    fontsize: 25, 
                    fontWeight: FontWeight.bold, 
                    textdecoration: TextDecoration.none, 
                    textAlign: TextAlign.start,
                    ),
                    GetBuilder<ProductController>(builder: (_){
                      return Padding(
                      padding: const EdgeInsets.only(right: 20,top: 50),
                      child: defualTextFormFeild(
                          onChange: (searchName){
                            productcontroller.addSearchToList(searchName);
                          },
                          controller: productcontroller.searchkey, 
                          inputtype: TextInputType.text, 
                          validate: null,
                          label: '',
                          labelcolor: Get.isDarkMode?darkClr:mainColor,
                          inputtextcolor: Colors.black,
                          maxlines: 1,
                          ifobscure: false,
                          prifixicon: Icon(Icons.search,color: Get.isDarkMode?darkClr:mainColor,size: 25,), 
                          sufixicon: productcontroller.searchkey.text.isNotEmpty? IconButton(
                            onPressed: (){
                              productcontroller.clearSearch();
                            }, 
                            icon: const Icon(Icons.clear,color: Colors.black,size: 20,),
                            ):Container(width: 0,),
                          ontab: (){}, 
                          cursorColor:Get.isDarkMode?darkClr:mainColor,
                          backgrouncolor: Colors.grey.shade300,
                          borderraduis: 15,
                          bordercolor: Colors.grey.shade300,
                          focusbordercolor: Get.isDarkMode?darkClr:mainColor,
                          hint: 'Search with name',
                          padding: const EdgeInsets.only(top: 10,bottom: 10),
                          ),
                    );
                    }
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
          
        Expanded(
          child: Column(
            children: [
              textUtils(
              text: 'Products'.tr, 
              color: Get.isDarkMode?Colors.white:Colors.black, 
              fontsize: 20, 
              fontWeight: FontWeight.bold, 
              textdecoration: TextDecoration.none, 
              textAlign: TextAlign.start,
                  ),
              CardItems(),
            ],
          ),
        ),
          ],
        ),
      );
      
    //   Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Container(
    //       width: double.infinity,
    //       height: 200,
    //       decoration: BoxDecoration(
    //         color: Get.isDarkMode?darkClr:mainColor,
    //         borderRadius: const BorderRadius.only(bottomLeft:Radius.circular(20) ,bottomRight:Radius.circular(20)),
    //       ),
    //       child: Padding(
    //         padding: const EdgeInsets.only(left: 20,top: 10,right: 20),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             textUtils(
    //             text: 'Find your'.tr, 
    //             color: Get.isDarkMode?Colors.black:Colors.white, 
    //             fontsize: 23, 
    //             fontWeight: FontWeight.normal, 
    //             textdecoration: TextDecoration.none, 
    //             textAlign: TextAlign.start,
    //             ),
    //             textUtils(
    //             text: 'INSPIRATION'.tr, 
    //             color: Get.isDarkMode?Colors.black:Colors.white, 
    //             fontsize: 25, 
    //             fontWeight: FontWeight.bold, 
    //             textdecoration: TextDecoration.none, 
    //             textAlign: TextAlign.start,
    //             ),
    //             GetBuilder<ProductController>(builder: (_){
    //               return Padding(
    //               padding: const EdgeInsets.only(right: 50,top: 50),
    //               child: defualTextFormFeild(
    //                   onChange: (searchName){
    //                     productcontroller.addSearchToList(searchName);
    //                   },
    //                   controller: productcontroller.searchkey, 
    //                   inputtype: TextInputType.text, 
    //                   validate: null,
    //                   label: '',
    //                   labelcolor: Get.isDarkMode?darkClr:mainColor,
    //                   inputtextcolor: Colors.black,
    //                   maxlines: 1,
    //                   ifobscure: false,
    //                   prifixicon: Icon(Icons.search,color: Get.isDarkMode?darkClr:mainColor,size: 25,), 
    //                   sufixicon: productcontroller.searchkey.text.isNotEmpty? IconButton(
    //                     onPressed: (){
    //                       productcontroller.clearSearch();
    //                     }, 
    //                     icon: const Icon(Icons.clear,color: Colors.black,size: 20,),
    //                     ):Container(width: 0,),
    //                   ontab: (){}, 
    //                   cursorColor:Get.isDarkMode?darkClr:mainColor,
    //                   backgrouncolor: Colors.grey.shade300,
    //                   borderraduis: 15,
    //                   bordercolor: Colors.grey.shade300,
    //                   focusbordercolor: Get.isDarkMode?darkClr:mainColor,
    //                   hint: 'Search with name',
    //                   padding: const EdgeInsets.only(top: 10,bottom: 10),
    //                   ),
    //             );
    //             }
    //             ),
                
    //           ],
    //         ),
    //       ),
    //     ),
    //      Padding(
    //             padding: const EdgeInsets.only(left: 20,top: 10,right: 20),
    //             child: textUtils(
    //               text: 'Products'.tr, 
    //               color: Get.isDarkMode?Colors.white:Colors.black, 
    //               fontsize: 20, 
    //               fontWeight: FontWeight.bold, 
    //               textdecoration: TextDecoration.none, 
    //               textAlign: TextAlign.start,
    //                   ),
    //               ),
    //     CardItems(),
    //   ],
    // );
 
      }
    });
        
  }
}