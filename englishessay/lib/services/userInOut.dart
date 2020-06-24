import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserControl{

  Future<void> getUserInfo(Map data)async{
    String url = "https://sureshkarki.000webhostapp.com/essay/getUserData.php";
    String email = data['email'];
    var response= await http.post(url,body: data);
    String userName = response.body;
    await setUserData(userName, email);    
  }

  setUserData(String username,String email,)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("userName", username);
    prefs.setString("email", email);
  }

  userLogIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("isLogged", true);
  }


userLogOut() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogged", false);
    
}

checkUserLogStat()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLogged =   prefs.getBool("isLogged") ?? false;
  return isLogged;
}
}