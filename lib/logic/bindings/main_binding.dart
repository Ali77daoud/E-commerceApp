import 'package:e_commerce_app/logic/controllers/main_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MainScreenController());
  }
}