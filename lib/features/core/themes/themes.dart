import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/global_variables.dart';

ThemeData lighTheme = ThemeData(
  textTheme: GoogleFonts.montserratTextTheme(),
  primaryColor: tPrimaryColor,
  primaryColorDark: Colors.black,
  cardColor: Colors.white,
  scaffoldBackgroundColor: tBgColor,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: tPrimaryColor,
    elevation: 0,
  ),
  colorScheme: ColorScheme.light(),
);

ThemeData darkTheme = ThemeData(
  textTheme: GoogleFonts.montserratTextTheme(),
  primaryColor: tBlackColor,
  primaryColorDark: Colors.white,
  cardColor: Colors.black,
  scaffoldBackgroundColor: tDarkColor,
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: tDarkColor,
    elevation: 3,
  ),
  colorScheme: ColorScheme.dark(),
);
