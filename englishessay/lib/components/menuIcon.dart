import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final String iconTitle;
  const MenuIcon({
  this.icon, this.iconTitle, this.iconColor, this.backgroundColor}) ;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.15,
      width: size.width * 0.3,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(icon,color: iconColor,size: 70,),
          Text(iconTitle,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,))
        ],
      ),
    );
  }
}