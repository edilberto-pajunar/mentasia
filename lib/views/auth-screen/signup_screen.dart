import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentasia/constants/global_variables.dart';
import 'package:mentasia/views/auth-screen/login_screen.dart';
import 'package:mentasia/views/chat-screen/conversation_screen.dart';
import 'package:mentasia/views/home.dart';
import 'package:mentasia/widgets/reusable_form.dart';
import 'package:mentasia/widgets/submit_card.dart';

import '../../controllers/auth.dart';

class SignupScreen extends StatefulWidget {
  static String route = "signupScreen";
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool showPass = false;

  RegExp regExp = new RegExp(
    r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
    caseSensitive: false,
    multiLine: false,
  );

  String? validateEmail(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty) {
      return "Email address is required";
    } else if (!regExp.hasMatch(formEmail)) {
      return "Please follow format: {email@gmail.com}";
    }
    return null;
  }

  String? validatePassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty) {
      return "Password is required";
    } else if (formPassword.length < 6) {
      return "Password is short";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _key,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hi! Let us set you an account",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                ReusableForm(
                  validator: validateEmail,
                  labelText: "Email",
                  controller: _emailController,
                  obscureText: false,
                ),
                SizedBox(
                  height: 20,
                ),
                ReusableForm(
                  validator: validatePassword,
                  labelText: "Password",
                  controller: _passwordController,
                  isPass: true,
                ),
                SizedBox(
                  height: 20,
                ),
                SubmitCard(
                    colorButton: Color(0xFF194545),
                    buttonText: "Sign Up",
                    onTap: () async {
                      if (_key.currentState!.validate()) {
                        await Auth().createAccount(
                          _emailController.text,
                          _passwordController.text,
                          context,
                        );
                        Navigator.pushNamed(context, ConversationScreen.route);
                      }
                    }),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, LoginScreen.route),
                      child: Text(
                        "Log in",
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
