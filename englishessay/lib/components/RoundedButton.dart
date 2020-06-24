import 'package:englishessay/themeConstants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Function press;
  
  const RoundedButton({
     this.text, this.textColor=Colors.white, this.press,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          color: kRoundededButton,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          onPressed: press,
          child: Text(text,style: TextStyle(color: textColor),),
        ),
      ),
    );
  }
}
