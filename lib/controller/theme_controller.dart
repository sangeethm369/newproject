import 'package:flutter/material.dart';
import 'package:newproject/utilities/my_themes/my_app_theme.dart';

class ThemeController extends ChangeNotifier {
  ThemeData themeData=MyAppTheme.myLightTheme;
  Icon themeIcon=const Icon(Icons.light_mode);
  bool light=true;
  void setTheme(){
    if (themeData==MyAppTheme.myLightTheme) {
      themeData=MyAppTheme.myDarkThem;
      light=false;
      themeIcon=const Icon(Icons.light_mode);
    } else {
      themeData=MyAppTheme.myLightTheme;
      light=true;
      themeIcon=const Icon(Icons.dark_mode);
    }
    notifyListeners();
  }
}