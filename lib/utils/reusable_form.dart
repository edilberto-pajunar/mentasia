import 'package:flutter/material.dart';
import 'package:mentasia/constants/global_variables.dart';

class ReusableForm extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  String? Function(String?)? validator;

  ReusableForm({
    super.key,
    required this.labelText,
    required this.controller,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: tBlackColor,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: tPrimaryColor,
          filled: true,
          hintText: labelText,
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 2,
              color: tBlackColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 2,
              color: tBlackColor,
            ),
          ),
        ),
        style: TextStyle(
          color: tWhiteColor,
        ),
      ),
    );
  }
}
