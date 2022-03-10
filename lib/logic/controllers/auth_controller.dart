import 'package:e_commerce_app/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController{
  bool isvisibilty = true;
  bool ischecked = false;
  bool ifCircleIndicatorShown=false;
  FirebaseAuth auth = FirebaseAuth.instance;

  var displyName = '';
  var displyUserPhoto = '';
  var displyEmail = '';

  var isSigenedIn = false;

  final GetStorage authbox = GetStorage();

  User ? get userProfile => auth.currentUser;

  @override
  void onInit() async{
    super.onInit();
    
    displyName = (userProfile != null ? userProfile!.displayName: " ")!;
    displyEmail = (userProfile != null ? userProfile!.email: " ")!;
    displyUserPhoto = (userProfile != null ? userProfile!.photoURL: " ")!;
    // for settings
    // lanLocal = await getLang;
  }
  
  void getUserProfile(){
    
  }

  void visibilty(){
    isvisibilty =!isvisibilty;

    update();
  }
  
  void checked(){
    ischecked =!ischecked;

    update();
  }

  void showCircleIndecator(){
    ifCircleIndicatorShown=true;
    update();
  }
  
  Future<void> signUpUsingFirebase({
    required String name,
    required String email,
    required String password,
  })async{
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) {
        displyName = name;
        displyEmail = email;
        auth.currentUser!.updateDisplayName(name);
      }
      );
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ');
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password  is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The email already exists ';
      }
      else{
        title = 'Problem';
        message = 'an error occured maybe no internet connection';
      }
      Get.snackbar(
        title, 
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        );
    } catch (e) {
      Get.snackbar(
        'Error', 
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        );
    }
  }

  void logInUsingFirebase(
    {
      required String email,
      required String password,
    }
  )async{
    try{
      await auth.signInWithEmailAndPassword(
        email: email, 
        password: password
        ).then((value){
          displyName = auth.currentUser!.displayName!;
          displyEmail = auth.currentUser!.email!;
          displyUserPhoto = auth.currentUser!.photoURL!;
        });
        
        ifCircleIndicatorShown=false;
        isSigenedIn = true;
        authbox.write("auth",isSigenedIn);
        update();
        Get.offNamed(Routes.mainScreen);
    }on FirebaseAuthException catch (e){
      ifCircleIndicatorShown=false;
      String title = e.code.replaceAll(RegExp('-'), ' ');
      String message = '';
      if(e.code == 'user-not-found'){
        message = 'user not found';
      }
      else if(e.code == 'wrong-password'){
        message='wrong password';
      }
      else{
        title = 'Problem';
        message = 'an error occured maybe no internet connection';
      }
      Get.snackbar(
        title, 
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        );
      } catch (e) {
        ifCircleIndicatorShown=false;
        Get.snackbar(
          'Error', 
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          );
    }
  }

  Future<void> googleSignIn()async{
    try{
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      displyName = googleUser!.displayName!;
      displyEmail = googleUser.email;
      displyUserPhoto = googleUser.photoUrl!;
      GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken
      );
      await auth.signInWithCredential(credential);

      ifCircleIndicatorShown=false;
      isSigenedIn = true;
      authbox.write("auth",isSigenedIn);
      update();
      Get.offNamed(Routes.mainScreen);
    }catch(e){
      ifCircleIndicatorShown=false;
      update();
      Get.snackbar(
              'Error', 
              e.toString(),
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white,
              );
      }
    
  }

  void faceBookSignUp(){}

  Future<void> resetPassword({required String email})async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    }on FirebaseAuthException catch (e){
      String title = e.code.replaceAll(RegExp('-'), ' ');
      String message = '';
      if(e.code == 'user-not-found'){
        message = 'user not found';
      }
      else if(e.code == 'wrong-password'){
        message='wrong password';
      }
      else{
        title = 'Problem';
        message = 'an error occured maybe no internet connection';
      }
      Get.snackbar(
        title, 
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        );
      } catch (e) {
        Get.snackbar(
          'Error', 
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          );
    }
  }

  void signOutFromApp()async{
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();

      displyName = '';
      displyName = '';
      displyEmail = '';

      ifCircleIndicatorShown=false;
      authbox.remove("auth");
      update();
      Get.offNamed(Routes.welcomeScreen);
    } catch (e) {
      Get.snackbar(
            'Error', 
            e.toString(),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            );
    }
  }
  
//for setting language
  // var lanBox = GetStorage();
  // var lanLocal = 'eng';

  

  // Future<String> get getLang async{
  //   return await lanBox.read('lang');
  // }

  void changeLanguage(String lang){
    Get.updateLocale(Locale(lang));
    // saveLanguage(lang);
    // if(lanLocal == lang){
    //   return;
    // }

    // if(lanLocal == 'ara'){
    //   lanLocal='ara';
    //   saveLanguage(lang);
    // }else if(lanLocal == 'eng'){
    //   lanLocal='eng';
    //   saveLanguage(lang);
    // }
    update();
  }

  // void saveLanguage(String lang)async{
  //   await lanBox.write('lang', lang);
  // }
}