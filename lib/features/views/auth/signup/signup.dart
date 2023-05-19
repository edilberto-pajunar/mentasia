import 'package:flutter/material.dart';
import 'package:mentasia/features/data/services/auth.dart';
import 'package:mentasia/features/views/auth/login/login.dart';
import 'package:mentasia/features/views/chat/conversation.dart';
import 'package:mentasia/widgets/cards/submit.dart';
import 'package:mentasia/widgets/form/reusable.dart';

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
  bool showPass = true;

  RegExp regExp = RegExp(
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
          child: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  minWidth: constraints.maxWidth,
                ),
                child: IntrinsicHeight(
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
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ReusableForm(
                          validator: validatePassword,
                          labelText: "Password",
                          controller: _passwordController,
                          isPass: showPass,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                showPass = !showPass;
                              });
                            },
                            child: showPass
                                ? Icon(
                                    Icons.remove_red_eye,
                                  )
                                : Icon(
                                    Icons.remove_red_eye_outlined,
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SubmitCard(
                            colorButton: Color(0xFF194545),
                            buttonText: "Sign Up",
                            onTap: () async {
                              if (_key.currentState!.validate()) {
                                await AuthServices().createAccount(
                                  _emailController.text,
                                  _passwordController.text,
                                  context,
                                );
                                // ignore: use_build_context_synchronously
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
                              onPressed: () => Navigator.pushNamed(context, LoginScreen.route),
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
          }),
        ),
      ),
    );
  }
}
