import 'package:e_commerce_app/language/arabic.dart';
import 'package:e_commerce_app/utils/my_string.dart';
import 'package:get/get.dart';
import 'english.dart';

class LocalizationApp extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    ara:ar,
    ene:en,
  };

}