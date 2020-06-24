import 'package:flutter/material.dart';

class AlreadyHaveAccountCheck extends StatelessWidget {
  final bool isLogin;
  final Function press;
  const AlreadyHaveAccountCheck({
   this.isLogin, this.press}) ;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          isLogin ? "Dont have an account? " :"Already have an account? "
          ,style: TextStyle(color: Theme.of(context).accentColor),),
        GestureDetector(
          onTap:press,
          child: Text(
            isLogin ? "Sign Up":"Sign In"
            ,style: TextStyle(color: Theme.of(context).accentColor,fontWeight: FontWeight.bold),))
      ],
    );
  }
}