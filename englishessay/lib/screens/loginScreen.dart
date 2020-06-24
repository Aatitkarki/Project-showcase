import 'package:englishessay/components/RoundedButton.dart';
import 'package:englishessay/components/alreadyHaveAccountCheck.dart';
import 'package:englishessay/components/roundedInputField.dart';
import 'package:englishessay/components/roundedPasswordField.dart';
import 'package:englishessay/screens/menuScreen.dart';
import 'package:englishessay/screens/registrationScreen.dart';
import 'package:englishessay/services/dialogBox.dart';
import 'package:englishessay/services/userInOut.dart';
import 'package:englishessay/services/userLogin.dart';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = new TextEditingController();
  FocusNode _passwordNode = new FocusNode();
  TextEditingController _passwordController = new TextEditingController();
  UserLogin userLogin = new UserLogin();
  String errorText;
  bool isLoading = false;

  Future<bool> loginUser(BuildContext context) async {
    Map data = {
      "action": "login",
      "email": _emailController.text,
      "password": _passwordController.text,
    };
    return await userLogin.loginUser(data, context);
  }

  void checkEmptyField() {
    if (_emailController.text.isEmpty) {
      errorText = "Email Field is empty";
    } else if (_passwordController.text.isEmpty) {
      errorText = "Password Field is empty";
    } else {
      errorText = "noError";
    }
  }

  bool isValidEmail(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset("assets/images/main_top.png",
                    width: size.width * 0.4),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/images/login_bottom.png",
                    width: size.width * 0.4,
                  )),
              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "LOGIN",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        SvgPicture.asset(
                          "assets/icons/login.svg",
                          height: size.height * 0.35,
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        RoundedInputField(
                          controller: _emailController,
                          hintText: "Your Email",
                          icon: Icons.email,
                          nextNode: _passwordNode,
                        ),
                        RoundedPasswordField(
                          controller: _passwordController,
                          hintText: "Password",
                          icon: Icons.lock,
                          isLastField: true,
                          node: _passwordNode,
                        ),
                        RoundedButton(
                          text: "LOGIN",
                          press: () async {
                            checkEmptyField();
                            setState(() {
                              isLoading = true;
                            });
                            if (errorText == "noError") {
                              if (isValidEmail(_emailController.text)) {
                                bool loggedIn = await loginUser(context);
                                if (loggedIn) {
                                  UserControl().userLogIn();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MenuScreen()));
                                }
                              } else {
                                AlertingData().showDialogBox(
                                    context,
                                    "Invalid Email",
                                    "Please enter a valid email to login");
                              }
                            } else {
                              Flushbar(
                                message: errorText,
                                backgroundColor: Colors.red,
                                animationDuration: Duration(seconds: 1),
                                duration: Duration(seconds: 1),
                              )..show(context);
                            }
                            setState(() {
                              isLoading = false;
                            });
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        AlreadyHaveAccountCheck(
                          isLogin: true,
                          press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RegistrationScreen()));
                          },
                        ),
                        RoundedButton(
                          text: "Login as Guest",
                          textColor: Colors.white,
                          press: () async {
                          await  UserControl().setUserData("Guest","guest@gmail.com");
                          await UserControl().userLogIn();
                          Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MenuScreen()));
                          },
                        )
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
