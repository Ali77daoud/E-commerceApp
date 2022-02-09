import 'package:e_commerce_app/logic/bindings/auth_binding.dart';
import 'package:e_commerce_app/view/screens/auth/login_screen.dart';
import 'package:e_commerce_app/view/screens/auth/signup_screen.dart';
import 'package:e_commerce_app/view/screens/welcome_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';


class Routes{
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signupScreen = '/signupScreen';
}


class AppRoute{
  //initial route
  static const welcome=Routes.welcomeScreen ; 
  //get pages
  static final routes =[
    GetPage(
      name:Routes.welcomeScreen , 
      page: ()=>const WelcomeScreen() 
      ),
      GetPage(
      name:Routes.loginScreen , 
      page: ()=>LoginScreen(), 
      ), 
      GetPage(
      name:Routes.signupScreen , 
      page: ()=>SignupScreen( ), 
      binding: AuthBinding(),
      ),
  ];
}

