import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/logic/controllers/cart_controller.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class ImageSlider  extends StatefulWidget {
  final String img;
  const ImageSlider ({required this.img ,Key? key }) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  CarouselController carouselController=CarouselController();
  int currentPage = 0;
  int currentColor = 0;
  final cartcontroller = Get.find<CartController>();
  final List<Color> colorSelected =[
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
    kCOlor4,
    kCOlor5, 
    kCOlor2,
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 3, 
          carouselController: carouselController,
          options: CarouselOptions(
            height: 400,
            autoPlay: true,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            autoPlayInterval: const Duration(seconds: 2),
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              setState(() {
                currentPage=index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex){
            return Container(
               margin: const EdgeInsets.all(10),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20),
                 image: DecorationImage(
                   image: NetworkImage(widget.img),
                   fit: BoxFit.fill
                   ),
               ),
            );
          }, 
          ),
        Positioned(
          bottom: 20,
          left: 155,
          child: AnimatedSmoothIndicator(
            activeIndex: currentPage, 
            count: 3,
            effect: ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: Get.isDarkMode?pinkClr:mainColor,
              dotColor:Colors.grey.shade600,
            ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 20,
            child: Container(
              height: 200,
              width: 50,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListView.separated(
                itemBuilder: (context,index)=>InkWell(
                  onTap: (){
                    setState(() {
                      currentColor=index;
                    });
                  },
                  child: ColorPicker(
                    outerBorder: currentColor == index,
                     color: colorSelected[index],
                     ),
                ), 
                separatorBuilder: (context,index)=>const SizedBox(width: 3,), 
                itemCount: colorSelected.length
                ),
            )
            ),
            Container(
              padding: const EdgeInsets.only(top: 10,right: 25,left:25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Get.isDarkMode?pinkClr:mainColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color:Get.isDarkMode?Colors.black:Colors.white,
                      ),
                    ),
                  ),
                  Obx((){
                    return Badge(
                      position: BadgePosition.topEnd(top: -10, end: -10),
                      animationDuration: const Duration(milliseconds: 300),
                      animationType: BadgeAnimationType.slide,
                      badgeContent: Text(
                        '${cartcontroller.totalCartProducts}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      child: InkWell(
                        onTap: (){
                        Get.toNamed(Routes.cartScreen);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Get.isDarkMode?pinkClr:mainColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.shopping_cart,
                            color:Get.isDarkMode?Colors.black:Colors.white,
                          ),
                        ),
                      ),
                    );
                  }),
                  
                ],
              ),
            )
      ],
  ),
    );
  }
}
