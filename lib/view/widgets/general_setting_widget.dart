import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralSetting extends StatelessWidget {
  
  final Widget leftPart;
  final String text;
  final Widget rightPart;
  const GeneralSetting({ 
    required this.leftPart,
    required this.text,
    required this.rightPart,
    Key? key 
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
     Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: leftPart,
            ),

            Expanded(
              flex: 4,
              child: textUtils(
                text: text, 
                color: Get.isDarkMode?Colors.white:Colors.black, 
                fontsize: 20, 
                fontWeight: FontWeight.bold, 
                textdecoration: TextDecoration.none, 
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis
                  ),
            ),
            
            Expanded(
              flex: 2,
              child:rightPart
            ),
          ],
        ),
      ],
    );
  }
}