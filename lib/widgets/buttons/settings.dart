import 'package:flutter/material.dart';
import 'package:mentasia/features/core/config/global_variables.dart';
import 'package:mentasia/features/data/provider/model_theme.dart';
import 'package:provider/provider.dart';

class SettingsButton extends StatelessWidget {
  final String textLabel;
  final String imageString;
  final VoidCallback onTap;

  const SettingsButton({
    super.key,
    required this.textLabel,
    required this.imageString,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<ModelTheme>(context).isDark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: darkTheme ? Colors.grey : tSecondaryColor,
          boxShadow: const [
            BoxShadow(
              color: tBlackColor,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Image(
                image: AssetImage(imageString),
                width: 20,
              ),
            ),
            Text(
              textLabel,
              style: TextStyle(
                color: darkTheme ? Colors.white : Colors.black,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
