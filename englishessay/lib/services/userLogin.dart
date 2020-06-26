import 'package:englishessay/services/dialogBox.dart';
import 'package:englishessay/services/networkChecker.dart';
import 'package:englishessay/services/userInOut.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class UserLogin {
  String registrationUrl = "https://sureshkarki.000webhostapp.com/essay/registration.php";
  String loginUrl = "https://sureshkarki.000webhostapp.com/essay/login.php";

  Future<void> registerUser(Map data, BuildContext context) async {
    if (await NetworkChecker().checkConnection(context)) {
      try {
        var response = await http.post(registrationUrl, body: data);
        if (response.body == "user exists") {
          AlertingData().showDialogBox(context, "Username Taken",
              "Sorry this username is already registered!");
        } else if (response.body == "email exists") {
          AlertingData().showDialogBox(context, "Invalid Email",
              "Sorry this email is already registered!");
        } else if (response.body == "success") {
          AlertingData().showDialogBox(
              context, "Success", "Your account is successfully created!");
        } else {
          AlertingData().showDialogBox(context, "Server Problem",
              "Sorry cannot register user due to server error!");
        }
      } catch (_) {
        AlertingData().showDialogBox(
            context, "Unexpected Error", "Try to register after some time!");
      }
    }
  }

  Future<bool> loginUser(Map data, BuildContext context) async {
    if (await NetworkChecker().checkConnection(context)) {
      try {
        var response = await http.post(loginUrl, body: data);
        if (response.body == "not register") {
          AlertingData().showDialogBox(
              context, "Wrong Email", "This email is not registered yet!");
        } else if (response.body == "wrong password") {
          AlertingData().showDialogBox(context, "Wrong email/Password",
              "Please enter correct email or password!");
        } else if (response.body == "success") {

          await UserControl().getUserInfo(data);
          return true;
        } else {
          AlertingData().showDialogBox(context, "Server Problem",
              "Sorry cannot login user due to server error!");
          
        }
      } catch (_) {
        AlertingData().showDialogBox(
            context, "Unexpected Error", "Cannot Login right now!");
      }
    }
    return false;
  }
}
