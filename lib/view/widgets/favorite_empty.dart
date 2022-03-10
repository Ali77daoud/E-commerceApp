import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteEmpty extends StatelessWidget {
  const FavoriteEmpty({ Key? key }) : super(key: key);

  get mainColor => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
            width: 150,
            child: Image.asset('assets/images/heart.png')
            ),
        ),
        const SizedBox(
          height: 20,
        ),
        textUtils(
            text: 'Favotites Screen', 
            color: Get.isDarkMode?Colors.white:Colors.black, 
            fontsize: 20, 
            fontWeight: FontWeight.bold, 
            textdecoration: TextDecoration.none, 
            textAlign: TextAlign.start,
          ),
      ],
    );
  }
}