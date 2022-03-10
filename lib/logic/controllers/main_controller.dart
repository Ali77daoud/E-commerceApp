import 'package:e_commerce_app/view/screens/category/category_screen.dart';
import 'package:e_commerce_app/view/screens/favorites_screen.dart';
import 'package:e_commerce_app/view/screens/home/home_screen.dart';
import 'package:e_commerce_app/view/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController{
  RxInt i = 0.obs;
  List<Widget> screens = [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    SettingScreen(),
  ].obs;

  List<String> titles = [
    'My Shop',
    'Categories',
    'Favorites',
    'Settings'
  ].obs;
}