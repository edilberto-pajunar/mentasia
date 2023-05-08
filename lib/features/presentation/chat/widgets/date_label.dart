import 'package:flutter/material.dart';

class DateLabel extends StatelessWidget {
  final String label;
  final Alignment alignment;

  const DateLabel({super.key, required this.label, required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
