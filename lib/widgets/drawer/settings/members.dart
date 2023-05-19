import 'package:flutter/material.dart';
import 'package:mentasia/widgets/cards/card.dart';

class MembersWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final String role;

  const MembersWidget({
    required this.imagePath,
    required this.name,
    required this.role,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Column(
        children: [
          Center(
            child: Image(
              image: AssetImage(imagePath),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CardWidget(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "Bachelor of Science in Computer Engineering Student Polytecnic University of the Philippines",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  role,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
