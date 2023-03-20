import 'package:flutter/material.dart';
import 'package:mentasia/constants/global_variables.dart';
import 'package:mentasia/screens/auth_screen/signup_screen.dart';
import 'package:mentasia/screens/home.dart';
import 'package:mentasia/utils/reusable_form.dart';
import 'package:mentasia/utils/submit_card.dart';

import '../../controllers/auth.dart';

class LoginScreen extends StatefulWidget {
  static String route = "loginScreen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void loginUser() async {
    await Auth().loginUser(
        _emailController.text.trim(), _passwordController.text.trim());

    Navigator.pushNamed(context, Home.route);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
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
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              SubmitCard(
                colorButton: Color(0xFF194545),
                buttonText: "Login",
                onTap: loginUser,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, SignupScreen.route),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
