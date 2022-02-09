import 'package:get/get.dart';

class AuthController extends GetxController{
  bool isvisibilty = true;
  
  void visibilty(){
    isvisibilty =!isvisibilty;

    update();
  }
}