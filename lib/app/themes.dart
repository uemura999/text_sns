import 'package:flutter/material.dart';
import 'package:text_sns/constant/colors.dart';

class Themes {
  static ThemeData lightTheme() => ThemeData.light().copyWith(
        primaryColor: kPrimaryColorLightTheme,
        scaffoldBackgroundColor: kContentColorLightTheme,
        appBarTheme: const AppBarTheme(color: kPrimaryColorLightTheme),
      );
  static ThemeData darkTheme() => ThemeData.dark().copyWith(
        primaryColor: kPrimaryColorDarkTheme,
        scaffoldBackgroundColor: kContentColorDarkTheme.withOpacity(0.87),
        appBarTheme: const AppBarTheme(color: kPrimaryColorDarkTheme),
      );
}
