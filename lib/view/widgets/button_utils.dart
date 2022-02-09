import 'package:flutter/material.dart';

Widget buttomUtils({
  required var ontab,
  required var childtext,
  required Color maincolor,
  required double radius,
  required double leftpadding,
  required double rightpadding,
  required double toppadding,
  required double buttompadding,
}){
  return ElevatedButton(
    onPressed: ontab, 
    child: childtext,
    style: ElevatedButton.styleFrom(
                primary: maincolor,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
                ),
                padding: EdgeInsets.only(left: leftpadding,right: rightpadding,top: toppadding,bottom: buttompadding),
              ),
          );
}