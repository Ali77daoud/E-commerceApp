import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

Widget categoryCard(
  {
    required String name,
    required String image,
  }
){
  return Padding(
    padding: const EdgeInsets.only(left:5,right: 5),
    child: Card(
      elevation: 5,
      shape: OutlineInputBorder(
        borderRadius:BorderRadius.circular(20),
        borderSide: BorderSide.none
        ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children:[ 
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(20),
              image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.contain,
                    )
            ),
          ),
          Positioned(
            left: 20,
            bottom: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius:BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,bottom: 5),
                child: textUtils(
                      text: name, 
                      color:Colors.white, 
                      fontsize: 23, 
                      fontWeight: FontWeight.bold, 
                      textdecoration: TextDecoration.none, 
                      textAlign: TextAlign.start,
                        ),
              ),
            ),
            ),
      ]
      ),
    ),
  );
}