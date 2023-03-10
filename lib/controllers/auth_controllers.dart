import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mentasia/screens/chat/chat_main.dart';
import 'package:mentasia/screens/chat/chat_page.dart';
import 'package:mentasia/screens/wrapper/home_screen.dart';
import 'package:mentasia/screens/auth_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthController extends GetxController {
  // sign up text editing controllers

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // login text editing controllers

  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createAccount() async {
    final user = await _auth.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    final firestore = FirebaseFirestore.instance;
    firestore.collection('users').doc(user.user!.uid).set(
      {
        "email": emailController.text,
        "password": passwordController.text,
      },
    );
    if (user != null) {
      Get.to(LoginScreen());
    } else {
      print("Error");
    }
  }

  Future<void> loginUser() async {
    final user = await _auth.signInWithEmailAndPassword(
      email: loginEmailController.text,
      password: loginPasswordController.text,
    );
    if (user != null) {
      // lets save user with shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("userID", user.user!.uid);
      print(user.user!.uid);
      Get.to(ChatMain());
    } else {
      print("error");
    }
  }

  // Logout Function
  Future<void> logoutUser() async {
    await _auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAll(
      HomeScreen(),
    );
  }
}
