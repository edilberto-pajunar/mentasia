import 'package:flutter/material.dart';
import 'package:mentasia/features/core/config/global_variables.dart';
import 'package:mentasia/features/data/services/auth.dart';
import 'package:mentasia/features/views/auth/signup/signup.dart';
import 'package:mentasia/features/views/chat/conversation.dart';
import 'package:mentasia/features/views/splash/hello.dart';
import 'package:mentasia/widgets/cards/submit.dart';
import 'package:mentasia/widgets/form/reusable.dart';

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
  bool showPass = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _key,
          child: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
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
                          height: 10,
                        ),
                        isLoading
                            ? CircularProgressIndicator()
                            : SubmitCard(
                                colorButton: Color(0xFF194545),
                                buttonText: "Login",
                                onTap: () async {
                                  if (_key.currentState!.validate()) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    await AuthServices().loginUser(
                                      _emailController.text,
                                      _passwordController.text,
                                    );
                                    setState(() {
                                      isLoading = false;
                                    });
                                    // ignore: use_build_context_synchronously
                                    Navigator.pushNamed(context, ConversationScreen.route);
                                  }
                                },
                              ),
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
                              onPressed: () => Navigator.pushNamed(context, SignupScreen.route),
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        TextButton(
                          onPressed: () => Navigator.pushNamed(context, HelloScreen.route),
                          child: Text(
                            "Back to Home",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                              fontSize: 18,
                            ),
                          ),
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
