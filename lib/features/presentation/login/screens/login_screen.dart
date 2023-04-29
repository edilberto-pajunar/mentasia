import 'package:flutter/material.dart';
import 'package:mentasia/features/core/config/global_variables.dart';
import 'package:mentasia/features/presentation/signup/screens/signup_screen.dart';
import 'package:mentasia/features/presentation/chat/screens/conversation_screen.dart';
import 'package:mentasia/widgets/reusable_form.dart';
import 'package:mentasia/widgets/submit_card.dart';

import '../../../data/services/auth.dart';

class LoginScreen extends StatefulWidget {
  static String route = "loginScreen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  void loginUser() async {
    await Auth().loginUser(
        _emailController.text.trim(), _passwordController.text.trim());

    Navigator.pushNamed(context, ConversationScreen.route);
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
                Image(
                  width: 120,
                  image: AssetImage(tSplashIcon),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    "Welcome back!",
                    style: TextStyle(
                      color: tBlackColor,
                      fontSize: 25,
                    ),
                  ),
                ),
                ReusableForm(
                  labelText: "Email",
                  controller: _emailController,
                ),
                SizedBox(
                  height: 20,
                ),
                ReusableForm(
                  labelText: "Password",
                  controller: _passwordController,
                  isPass: true,
                ),
                SizedBox(
                  height: 10,
                ),
                SubmitCard(
                    colorButton: Color(0xFF194545),
                    buttonText: "Login",
                    onTap: () async {
                      if (_key.currentState!.validate()) {
                        await Auth().loginUser(
                          _emailController.text,
                          _passwordController.text,
                        );
                        Navigator.pushNamed(context, ConversationScreen.route);
                      }
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, SignupScreen.route),
                      child: Text(
                        "Sign up",
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
