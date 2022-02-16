import 'package:flutter/material.dart';

Widget textUtils({
  required String text,
  required Color color,
  required double fontsize,
  required FontWeight fontWeight,
  required TextDecoration textdecoration,
  required TextAlign textAlign,
  }){
  return Text(
    text,
    style: TextStyle(
      decoration: textdecoration,
      color: color,
      fontFamily: 'Lato',
      fontSize: fontsize,
      fontWeight: fontWeight, 
    ),
    textAlign: textAlign,
    );
}