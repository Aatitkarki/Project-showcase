import 'package:chatapp/screens/login_screen.dart';
import 'package:chatapp/screens/registration_screen.dart';
import 'package:chatapp/screens/roundedButtons.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "WelcomeScreen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  Animation tweenAnimation;
  Animation textTweenAnimation;
  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    super.initState();
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.decelerate);
    animationController.forward();
    tweenAnimation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(animationController);
    //textTweenAnimation = TextStyleTween(begin: ksmallTextStyle,end: kbigTextStyle).animate(animationController);
    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     animationController.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     //animationController.forward();
    //   }
    // });
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tweenAnimation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: animation.value * 100,
                  ),
                ),
                TypewriterAnimatedTextKit(
                    speed: Duration(milliseconds: 200),
                    totalRepeatCount: 1,
                    pause: Duration(milliseconds: 100),
                    text: ["Flash Chat"],
                    textStyle:
                        TextStyle(fontSize: 32.0, color: Colors.black,fontWeight: FontWeight.bold),
                    
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(colour: Colors.blue,buttonName: "Log in",onPress: (){Navigator.pushNamed(context, LoginScreen.id);},),
            RoundedButton(colour: Colors.blueAccent,buttonName: "Register",onPress: (){Navigator.pushNamed(context, RegistrationScreen.id);}),
            
          ],
        ),
      ),
    );
  }
}
