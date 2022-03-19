import 'package:e_commerce_app/logic/controllers/product_controller.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ClothesInfo extends StatefulWidget {
  final String title;
  final int productId;
  double rate;
  final String discription;
  ClothesInfo({
     required this.title,
     required this.productId,
     required this.rate,
     required this.discription,
     Key? key
      }) : super(key: key);

  @override
  State<ClothesInfo> createState() => _ClothesInfoState();
}

class _ClothesInfoState extends State<ClothesInfo> {
  final productcontroller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: textUtils(
                  text: widget.title, 
                  color: Get.isDarkMode?Colors.white:Colors.black,
                  fontsize: 16, 
                  fontWeight: FontWeight.bold, 
                  textdecoration: TextDecoration.none, 
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis
                  ),
              ),
              Obx((){
                return Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                  color: Get.isDarkMode?Colors.white:Colors.grey.shade300,
                  shape: BoxShape.circle,
                    ),
                  child: InkWell(
                    onTap: (){
                      productcontroller.manageFavorite(widget.productId);
                    },
                    child: productcontroller.ifFavorite(widget.productId)?const Icon(
                      Icons.favorite,
                      color:Colors.red,
                      size: 20,
                        ):const Icon(
                        Icons.favorite_border_outlined,
                        color:Colors.black,
                        size: 20,
                    
                  ),
                  ),
                );
              }
              )
            ],
          ),
          Row(
            children: [
              textUtils(
                text: widget.rate.toString(), 
                color: Get.isDarkMode?Colors.white:Colors.black,
                fontsize: 18, 
                fontWeight: FontWeight.bold, 
                textdecoration: TextDecoration.none, 
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis
                ),
                RatingBar.builder(
                  itemSize:30 ,
                  initialRating: widget.rate,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  maxRating: 5,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      widget.rate =rating;
                    });
                    
                  },
              ),
            ],
          ),
          const SizedBox(height: 20,),
          ReadMoreText(
            widget.discription,
            trimLines: 3,
            trimMode: TrimMode.Line,
            textAlign: TextAlign.justify,
            trimCollapsedText: 'Show more',
            trimExpandedText:'Show less' ,
            lessStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode?darkClr:mainColor,
            ),
            moreStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode?darkClr:mainColor,
            ),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Get.isDarkMode?Colors.white:Colors.black,
            ),
            ),
        ],
        ),
    );
  }
}