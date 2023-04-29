import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentasia/features/core/config/global_variables.dart';

class SubmitCard extends StatelessWidget {
  final String buttonText;
  final Color? colorButton;
  final Color? colorText;
  final double paddingWidth;
  VoidCallback onTap;

  SubmitCard({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.colorButton,
    this.colorText,
    this.paddingWidth = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: paddingWidth,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: colorButton,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: tBlackColor,
              width: 2,
            ),
            boxShadow: const [
              BoxShadow(
                color: tBlackColor,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              buttonText,
              style: GoogleFonts.barlow(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
