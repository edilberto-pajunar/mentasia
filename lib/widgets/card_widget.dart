import 'package:flutter/material.dart';

import '../features/core/config/global_variables.dart';

class CardWidget extends StatelessWidget {
  final Widget child;
  const CardWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: tPrimaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
