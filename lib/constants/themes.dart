import 'package:flutter/material.dart';

import 'global_variables.dart';

ThemeData lighTheme = ThemeData(
  primaryColor: tPrimaryColor,
  scaffoldBackgroundColor: tBgColor,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: tPrimaryColor,
    elevation: 0,
  ),
);

ThemeData darkTheme = ThemeData(
  primaryColor: tDarkColor,
  scaffoldBackgroundColor: tBlackColor,
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: tBlackColor,
    elevation: 0,
  ),
);
