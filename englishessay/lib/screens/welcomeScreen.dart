import 'package:englishessay/components/RoundedButton.dart';
import 'package:englishessay/components/background.dart';
import 'package:englishessay/screens/loginScreen.dart';
import 'package:englishessay/screens/menuScreen.dart';
import 'package:englishessay/services/databaseHelper.dart';
import 'package:englishessay/services/userInOut.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MultiProvider(
      providers: [
       // FutureProvider(create: (context)=>DatabaseHelper.db.getUserData()),
        FutureProvider(create: (context)=>DatabaseHelper.db.getAllEssays()),
        ChangeNotifierProvider(create: (context) => DatabaseHelper()),
      ],
      child:
    Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Welcome to Hamro Essay",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
              SizedBox(
                height: size.height * 0.03,
              ),
              SvgPicture.asset(
                "assets/icons/book_lover.svg",
                height: size.height * 0.45,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              RoundedButton(
                text: "LET\'S DIVE TO HAMRO ESSSAY",
                press: () async {
                  final bool isLogged = await UserControl().checkUserLogStat();
                  if (isLogged ==false) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  } else if(isLogged == true){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MenuScreen()));
                  }
                },
              ),
              
            ],
          ),
        ),
      ),)
    );
  }
}
