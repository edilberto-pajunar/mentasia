import 'package:flutter/material.dart';

class IconBackground extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const IconBackground({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueGrey,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        splashColor: Colors.grey[100],
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Icon(
            icon,
            size: 18,
          ),
        ),
      ),
    );
  }
}
