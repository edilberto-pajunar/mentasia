import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentasia/screens/chat/chat_main.dart';
import 'package:mentasia/screens/wrapper/home_screen.dart';

class Wrapper extends StatelessWidget {
  static String route = "wrapper";
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return ChatMain();
            } else if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.hasError}"),
              );
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return HomeScreen();
        });
  }
}
