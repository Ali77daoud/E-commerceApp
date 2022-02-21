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
  var displyName = '';
  var displyUserPhoto = '';
  var isSigenedIn = false;

  final GetStorage authbox = GetStorage();

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
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) {
        displyName=name;
        FirebaseAuth.instance.currentUser!.updateDisplayName(name);
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
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, 
        password: password
        ).then((value){
         displyName=FirebaseAuth.instance.currentUser!.displayName!;
        }
         );
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
      displyName=googleUser!.displayName!;
      displyUserPhoto=googleUser.displayName!;
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
      displyName= '';
      displyName= '';
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

  

}