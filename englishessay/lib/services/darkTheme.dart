import 'package:shared_preferences/shared_preferences.dart';
class AppTheme{
  setDarkTheme(bool value)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("darktheme", value);
   }

   Future<bool> getTheme ()async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("darktheme") ?? false;
   }

}