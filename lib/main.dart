import 'package:e_commerce_app/language/localization.dart';
import 'package:e_commerce_app/logic/controllers/theme_controller.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/utils/my_string.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //for language
      locale:  Locale(ene),
      fallbackLocale:Locale(ene),
      translations: LocalizationApp(),
      //
      title: 'Flutter Demo',
      themeMode: ThemeController().themeDataGet,
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      initialRoute: FirebaseAuth.instance.currentUser !=null || GetStorage().read<bool>('auth') == true?
        Routes.mainScreen:Routes.welcomeScreen,
      getPages: AppRoute.routes,
    );
  }
}
 