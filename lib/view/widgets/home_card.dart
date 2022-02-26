import 'package:flutter/material.dart';

Widget homeCard(
  {
    required double elevation,
    required Color color,
    required double radius,
    required var lefticon,
    required var righticon,
    required var centertext,
    required String img,
    required double price,
    required double rate,
  }
){
  return Card(
    color: color,
    elevation: elevation,
    shadowColor: Colors.white,
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide.none
       ),

    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              lefticon,
              centertext,
              righticon,
            ],
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5,right: 5,),
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(img),
                      fit: BoxFit.contain,
                    )
                  ),
                ),
              ),
              Container(
                width: 130,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.withOpacity(0.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children:  [
                          Text('$price',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.black),),
                          const Text('\$',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black),),
                        ],
                      ),
                      Row(
                        children: [
                          Text('$rate',style: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black),),
                          Icon(Icons.star,size: 15,color: Colors.yellow.shade800,),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    )
  );
}