import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController{
  
  final GetStorage box = GetStorage();
  String key = 'isDarkMode';

  saveThemeDataInBox(bool isDark){
    box.write(key, isDark);
  }

  bool getThemeDataFromBox(){
   return box.read<bool>(key) ?? true;
  }

  ThemeMode get themeDataGet=>getThemeDataFromBox()?ThemeMode.dark:ThemeMode.light;

  void changetheme(){
    Get.changeThemeMode(getThemeDataFromBox()?ThemeMode.light:ThemeMode.dark);
    saveThemeDataInBox(!getThemeDataFromBox());
  }
}