import 'package:e_commerce_app/view/screens/category_screen.dart';
import 'package:e_commerce_app/view/screens/favorites_screen.dart';
import 'package:e_commerce_app/view/screens/home_screen.dart';
import 'package:e_commerce_app/view/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController{
  RxInt i = 0.obs;
  List<Widget> screens = [
    const HomeScreen(),
    const CategoryScreen(),
    const FavoriteScreen(),
    SettingScreen(),
  ].obs;
}