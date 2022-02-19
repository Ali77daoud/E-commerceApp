import 'package:e_commerce_app/logic/bindings/auth_binding.dart';
import 'package:e_commerce_app/logic/bindings/main_binding.dart';
import 'package:e_commerce_app/view/screens/auth/forgotpass_screen.dart';
import 'package:e_commerce_app/view/screens/auth/login_screen.dart';
import 'package:e_commerce_app/view/screens/auth/signup_screen.dart';
import 'package:e_commerce_app/view/screens/category_screen.dart';
import 'package:e_commerce_app/view/screens/favorites_screen.dart';
import 'package:e_commerce_app/view/screens/home_screen.dart';
import 'package:e_commerce_app/view/screens/main_screen.dart';
import 'package:e_commerce_app/view/screens/setting_screen.dart';
import 'package:e_commerce_app/view/screens/welcome_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';


class Routes{
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signupScreen = '/signupScreen';
  static const forgotpassScreen = '/forgotpassScreen';
  static const mainScreen = '/mainScreen';
  static const homeScreen = '/homeScreen';
  static const categoryScreen = '/categoryScreen';
  static const favoriteScreen = '/favoriteScreen';
  static const settingScreen = '/settingScreen';
}


class AppRoute{
  //initial route
  static const welcome=Routes.welcomeScreen ; 
  static const main=Routes.mainScreen ;
  //get pages
  static final routes =[
    GetPage(
      name:Routes.welcomeScreen , 
      page: ()=>const WelcomeScreen() 
      ),
      GetPage(
      name:Routes.loginScreen , 
      page: ()=>LoginScreen(), 
      binding: AuthBinding(),
      ), 
      GetPage(
      name:Routes.signupScreen , 
      page: ()=>SignupScreen( ), 
      binding: AuthBinding(),
      ),
      GetPage(
      name:Routes.forgotpassScreen , 
      page: ()=>ForgotPassScreen(), 
      binding: AuthBinding(),
      ),
      GetPage(
      name:Routes.mainScreen , 
      page: ()=>MainScreen(), 
      bindings: [AuthBinding(),MainBinding()],
      ),
      GetPage(
      name:Routes.homeScreen , 
      page: ()=>HomeScreen(), 
      binding: AuthBinding(),
      ),
      GetPage(
      name:Routes.categoryScreen , 
      page: ()=>CategoryScreen(), 
      binding: AuthBinding(),
      ),
      GetPage(
      name:Routes.favoriteScreen , 
      page: ()=>FavoriteScreen(), 
      binding: AuthBinding(),
      ),
      GetPage(
      name:Routes.settingScreen , 
      page: ()=>SettingScreen(), 
      binding: AuthBinding(),
      ),
  ];
}

