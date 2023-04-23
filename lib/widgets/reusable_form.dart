import 'package:flutter/material.dart';
import 'package:mentasia/constants/global_variables.dart';

class ReusableForm extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  final bool isPass;
  String? Function(String?)? validator;

  ReusableForm({
    super.key,
    required this.labelText,
    required this.controller,
    this.obscureText = false,
    this.validator,
    this.isPass = false,
  });

  @override
  State<ReusableForm> createState() => _ReusableFormState();
}

class _ReusableFormState extends State<ReusableForm> {
  bool showPass = false;
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
        validator: widget.validator,
        controller: widget.controller,
        obscureText: showPass ? true : widget.obscureText,
        decoration: InputDecoration(
          suffixIcon: widget.isPass
              ? InkWell(
                  child: showPass
                      ? Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                        )
                      : Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.black,
                        ),
                  onTap: () {
                    setState(() {
                      showPass = !showPass;
                    });
                  },
                )
              : SizedBox.shrink(),
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
