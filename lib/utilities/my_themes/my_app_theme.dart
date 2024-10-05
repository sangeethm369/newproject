import 'package:flutter/material.dart';
import 'package:newproject/utilities/constants/my_colors.dart';
import 'package:newproject/utilities/my_themes/my_appbar_them.dart';

class MyAppTheme {
  MyAppTheme._();
  static  ThemeData myLightTheme=ThemeData(
    appBarTheme: MyAppbarThem.lightAppBarTheme(),
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      surface: ligtBackColor,
      primary: lightPrimaryColor,

    )
   );
   static ThemeData myDarkThem=ThemeData(
    appBarTheme: MyAppbarThem.darkAppBarTheme(),
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      surface: darkBackColor,
      primary: darkPrimaryColor,
      
    )
    
  );
  
}