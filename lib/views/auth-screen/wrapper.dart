import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentasia/views/chat-screen/conversation_screen.dart';
import 'package:mentasia/views/home.dart';
import 'package:mentasia/views/hello_screen.dart';


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
              return ConversationScreen();
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
          return HelloScreen();
        });
  }
}
