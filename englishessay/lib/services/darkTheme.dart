import 'package:shared_preferences/shared_preferences.dart';
class AppTheme{
  setDarkTheme(bool value)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("theme set to $value");
    prefs.setBool("darktheme", value);
   }

   Future<bool> getTheme ()async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     print("i got this theme ${prefs.getBool("darktheme")}");
    return prefs.getBool("darktheme") ?? false;
   }

}