import 'package:flutter/material.dart';
import 'package:newproject/utilities/my_themes/my_appbar_them.dart';

class MyAppTheme {
  MyAppTheme._();
  static  ThemeData myLightTheme=ThemeData(
    appBarTheme: MyAppbarThem.lightAppBarTheme(),
    primaryColor: Colors.grey.shade300,
    splashColor: Colors.amber
  );
   static ThemeData myDarkThem=ThemeData(
    appBarTheme: MyAppbarThem.darkAppBarTheme(),
    primaryColor: Colors.black,
    splashColor: Colors.lightBlue

  );
  
}