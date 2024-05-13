import 'package:flutter/material.dart';

class AppTheme {
  static const Color dark = Color(0XFF0D0D0F);
  static const Color dark2 = Color(0XFF111115);
  static const Color dark3 = Color(0XFF151515);
  static const Color dark4 = Color(0XFF161619);
  static const Color grey1 = Color(0xFFE1E1E5);
  static const Color grey2 = Color(0xFFB1B1B8);
  static const Color stroke = Color(0XFF3E3F48);
  static const Color error = Color(0XFFCC0C0C);
  static const Color success = Color(0XFF00AC3A);

  static const Color transparent = Colors.transparent;

  static final theme = ThemeData(
    fontFamily: 'Inter',
    splashColor: transparent,
    highlightColor: transparent,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: dark3,
      elevation: 0,
      shape: Border(
        bottom: BorderSide(color: stroke),
      ),
    ),
  );
}
