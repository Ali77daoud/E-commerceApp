import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeList extends StatefulWidget {
  const SizeList({ Key? key }) : super(key: key);

  @override
  State<SizeList> createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {
  final List<String> sizeList = ['S','M','L','XL','XXL'];
  var currentSellcted = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index)=>InkWell(
          onTap: (){
            setState(() {
              currentSellcted=index;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            decoration: BoxDecoration(
              color:currentSellcted==index?
              Get.isDarkMode?darkClr: mainColor:
              Get.isDarkMode?Colors.grey.shade500: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.withOpacity(0.4),width: 2),
            ),
            child: textUtils(
                  text: sizeList[index], 
                  color: Get.isDarkMode?Colors.black: Colors.white,
                  fontsize: 16, 
                  fontWeight: FontWeight.bold, 
                  textdecoration: TextDecoration.none, 
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis
                  ),
          ),
        ), 
        separatorBuilder: (context,index)=> const SizedBox(width: 10,), 
        itemCount: sizeList.length,
        ),
    );
  }
}