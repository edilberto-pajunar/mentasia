import 'package:flutter/material.dart';

class NavigationBarItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final int index;
  final ValueChanged<int> onTap;
  final bool isSelected;

  const NavigationBarItem(
      {super.key,
      required this.label,
      required this.icon,
      required this.index,
      this.isSelected = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? Colors.lightBlue : null,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              label,
              style: isSelected
                  ? TextStyle(fontWeight: FontWeight.bold, fontSize: 11)
                  : TextStyle(
                      fontSize: 11,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
