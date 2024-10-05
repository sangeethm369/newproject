import 'package:flutter/material.dart';
import 'package:newproject/utilities/constants/my_colors.dart';

class MyAppbarThem {
  MyAppbarThem._();
  static AppBarTheme lightAppBarTheme() => const AppBarTheme(
    color: lightSecondaryColor,
    titleTextStyle: TextStyle(color: Colors.black));

  static AppBarTheme darkAppBarTheme() => const AppBarTheme(
    color:darkSecondaryColor,
    titleTextStyle: TextStyle(color: Colors.white));
  
}