import 'package:flutter/material.dart';

class MenuContainer extends StatelessWidget {
  final double height;
  final double width;

  const MenuContainer({
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1),
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.black87),
    );
  }
}