import 'package:flutter/material.dart';
import 'package:mentasia/features/core/config/global_variables.dart';
import 'package:mentasia/features/data/services/auth.dart';
import 'package:mentasia/features/views/chat/conversation.dart';
import 'package:mentasia/features/views/auth/login/login.dart';
import 'package:mentasia/widgets/cards/submit.dart';

class HelloScreen extends StatefulWidget {
  static String route = "HelloScreen";

  const HelloScreen({super.key});

  @override
  State<HelloScreen> createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  bool isLoading = false;

  void signinGuest(context) async {
    setState(() {
      isLoading = true;
    });
    await AuthServices().signInAnonymously();

    setState(() {
      isLoading = false;
    });

    Navigator.pushNamed(context, ConversationScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [
              tPrimaryColor,
              tWhiteColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 24.0,
                  ),
                ),
                SizedBox(
                  height: 150,
                ),

                // Image Logo
                Center(
                  child: Image(
                    height: 120,
                    width: 120,
                    image: AssetImage(tSplashIcon),
                  ),
                ),

                // Body
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "Welcome to Mentasia",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: tBlackColor,
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                Center(
                    child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Sign in to start a message",
                      style: TextStyle(
                        color: tBlackColor,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "with our chatbot",
                      style: TextStyle(
                        color: tBlackColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                )),
                SizedBox(
                  height: 150,
                ),

                // Chat now
                isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Center(
                        child: SubmitCard(
                          buttonText: "CHAT NOW",
                          onTap: () => signinGuest(context),
                          colorButton: tPrimaryColor,
                        ),
                      ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, LoginScreen.route),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
