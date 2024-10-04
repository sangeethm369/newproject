import 'package:flutter/material.dart';
import 'package:newproject/utilities/constants/my_colors.dart';

class MyAppbarThem {
  MyAppbarThem._();
  static AppBarTheme lightAppBarTheme() => const AppBarTheme(
    color: lightSecondaryColor,
    titleTextStyle: TextStyle(color: Colors.white));

  static AppBarTheme darkAppBarTheme() => AppBarTheme(
    color:darkSecondaryColor,
    titleTextStyle: const TextStyle(color: Colors.white));
  
}