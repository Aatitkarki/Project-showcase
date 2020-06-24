import 'package:englishessay/components/textfieldContainer.dart';
import 'package:englishessay/constants.dart';
import 'package:englishessay/themeConstants.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final FocusNode node,nextNode;
  final TextEditingController controller;

  const RoundedInputField({
    @required this.hintText,
    @required this.icon,
    @required this.controller, this.node, this.nextNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
          style: kInputTextStyle,
          focusNode:node ,
          onEditingComplete: (){
            nextNode.requestFocus();
          },
          
          textInputAction: TextInputAction.next,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontFamily: "Ubuntu"),
          icon: Icon(
            icon,
            color: kRoundededButton,
          ),
          border: InputBorder.none),
    ));
  }
}
