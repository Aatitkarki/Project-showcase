import 'package:englishessay/services/darkTheme.dart';
import 'package:flutter/cupertino.dart';

class ThemeProvider with ChangeNotifier{
  AppTheme appTheme =  new AppTheme();

  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;
  
  set darkTheme(bool value){
    _darkTheme = value;
    appTheme.setDarkTheme(value);
    notifyListeners();
  }
}