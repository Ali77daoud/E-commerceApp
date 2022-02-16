import 'package:e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({ Key? key }) : super(key: key);

  final authcontroller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.red,
        title: const Text('welcome'),
      ),
      body: Container(
        child: Text(FirebaseAuth.instance.currentUser!.displayName.toString()),
        ),
    );
  }
}