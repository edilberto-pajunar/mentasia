import 'package:flutter/material.dart';
import 'package:mentasia/features/core/config/global_variables.dart';

class ReusableForm extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final bool isPass;
  final Widget? suffixIcon;
  final int? maxLines;
  String? Function(String?)? validator;

  ReusableForm({
    super.key,
    required this.labelText,
    required this.controller,
    this.validator,
    this.isPass = false,
    this.suffixIcon,
    this.maxLines,
  });

  @override
  State<ReusableForm> createState() => _ReusableFormState();
}

class _ReusableFormState extends State<ReusableForm> {
  bool showPass = true;
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
        maxLines: widget.maxLines ?? 1,
        validator: widget.validator,
        controller: widget.controller,
        obscureText: widget.isPass,
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon,
          fillColor: tPrimaryColor,
          filled: true,
          hintText: widget.labelText,
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
