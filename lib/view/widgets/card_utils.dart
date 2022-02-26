import 'package:flutter/material.dart';

Widget cardUtils({
  required String img,
  required String title,
  required double price,
  required Color textcolor,
  required var firstIcon,
  required int flex,
  required var secondIcon,
}){
  return Card(
    elevation: 3,
    child: SizedBox(
      height: 130,
      child: Padding(
        padding: const EdgeInsets.only(left:5),
        child: Row(
          children: [
            Expanded(
              flex: 0,
              child: Container(
                height: 110,
                width: 120,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: NetworkImage(img),
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
                    child: Text('${price.toStringAsFixed(2)}\$',style: TextStyle(
                      color: textcolor,
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
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