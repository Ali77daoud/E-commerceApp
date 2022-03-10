import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget cardUtils({
  required String img,
  required bool ifNetworkImage,
  required String title,
  required String underText,
  required Color textcolor,
  required var firstIcon,
  required int flex,
  required var secondIcon,
}){
  return Card(
    elevation: 1,
    color: Get.isDarkMode?Colors.grey.shade900:Colors.white,
    child: SizedBox(
      height: 130,
      child: Padding(
        padding: const EdgeInsets.only(left:5),
        child: Row(
          children: [
            Expanded(
              flex: 0,
              child: Container(
                height: 100,
                width: 100,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image:
                  ifNetworkImage?
                   DecorationImage(
                      image: 
                      NetworkImage(img) ,
                      fit: BoxFit.contain,
                    ):
                    DecorationImage(
                      image: 
                      AssetImage(img) ,
                      fit: BoxFit.contain,
                    )
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 5),
                    child: Text(title,style: TextStyle(
                      color: textcolor,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 5,top: 10),
                    child: Text(underText,style: TextStyle(
                      color: textcolor,
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.normal,
                    ),
                    maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: flex,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  firstIcon,
                  secondIcon,
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}