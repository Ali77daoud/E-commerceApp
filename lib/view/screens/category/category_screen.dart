import 'package:e_commerce_app/logic/controllers/category_controller.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/screens/category/category_items.dart';
import 'package:e_commerce_app/view/widgets/category_card.dart';
import 'package:e_commerce_app/view/widgets/not_found.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({ Key? key }) : super(key: key);

  final categorycontroller = Get.put(CategoryController());
  final keyrefresh = GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Scaffold(
      body:categorycontroller.isLoading.value?
      Center(child:CircularProgressIndicator(
        color:Get.isDarkMode?pinkClr:mainColor,
        )
        ):
       RefreshIndicator(
         key: keyrefresh,
         triggerMode: RefreshIndicatorTriggerMode.anywhere,
           color: Get.isDarkMode?pinkClr:mainColor,
           onRefresh: ()async{
             await categorycontroller.getCategory();
           },
         child: Padding(
           padding: const EdgeInsets.only(top: 20),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    return 
                    categorycontroller.categorynameList.isEmpty?
                    Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3),
                      child: const NotFound(),
                    ):
                    InkWell(
                      onTap: (){
                      Get.to(()=> CategoryItems(
                        categoryName: categorycontroller.categorynameList[index],
                        index: index,
                      ));
                      categorycontroller.getAllCategory(index);
                        
                      },
                      child: categoryCard(
                        name: categorycontroller.categorynameList[index],
                        image:  categorycontroller.categoryImages[index],
                      )
                      );
                  }, 
                  separatorBuilder: (context,index){
                    return const SizedBox(height: 10,);
                  }, 
                  itemCount: 
                  categorycontroller.categorynameList.isEmpty?
                  1:
                  categorycontroller.categorynameList.length,
                  ),
              ),
            ],
               ),
         ),
       ),
    );
    }
    );
  }
}