import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentasia/features/core/config/global_variables.dart';
import 'package:mentasia/features/presentation/splash/screens/wrapper.dart';

class SplashScreen extends StatefulWidget {
  static String route = "/";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamed(context, Wrapper.route),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: tPrimaryColor,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              AnimatedPositioned(
                duration: Duration(milliseconds: 1600),
                top: 150,
                child: const Image(
                  width: 120,
                  height: 120,
                  image: AssetImage(tSplashIcon),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 1600),
                top: 320,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 1600),
                  opacity: 1,
                  child: Text(
                    "MENTASIA",
                    style: GoogleFonts.barlowCondensed(
                      fontSize: 60,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                bottom: 20,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1600),
                  opacity: 1,
                  child: Text(
                    "made by Rechaerg",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
