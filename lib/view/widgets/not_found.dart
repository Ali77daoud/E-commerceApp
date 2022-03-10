import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotFound extends StatelessWidget {
  const NotFound({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
            Get.isDarkMode?
            Image.asset('assets/images/nothing_found_white.png'):
            Image.asset('assets/images/nothing_found_green.png'),
            textUtils(
                    text: 'Nothing Found', 
                    color: Get.isDarkMode?Colors.white:mainColor, 
                    fontsize: 20, 
                    fontWeight: FontWeight.bold, 
                    textdecoration: TextDecoration.none, 
                    textAlign: TextAlign.start,
                      ),
          ],
          );
  }
}