import 'package:englishessay/components/textfieldContainer.dart';
import 'package:englishessay/constants.dart';
import 'package:englishessay/themeConstants.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final FocusNode node;
  final FocusNode nextNode;
  final bool isLastField;
  final TextEditingController controller;
  const RoundedPasswordField({
    this.hintText,
    this.icon,
    this.controller,
    this.node,
    this.isLastField,
    this.nextNode,
  });

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool hideText = true;

  toggleVisibility() {
    setState(() {
      hideText = !hideText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        style: kInputTextStyle,
        focusNode: widget.node,
        controller: widget.controller,
        obscureText: hideText,
        textInputAction:
            widget.isLastField ? TextInputAction.done : TextInputAction.next,
        onEditingComplete: () {
          if (!widget.isLastField) {
            widget.nextNode.requestFocus();
          } else {
            FocusScope.of(context).unfocus();
          }
        },
        decoration: InputDecoration(
          
            hintText: widget.hintText,
            hintStyle: TextStyle(fontFamily: "Ubuntu"),
            icon: Icon(
              widget.icon,
              color: kRoundededButton,
            ),
            suffixIcon: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                toggleVisibility();
              },
              icon: Icon(
                hideText ? Icons.visibility : Icons.visibility_off,
                color: kRoundededButton,
              ),
            ),
            border: InputBorder.none),
      ),
    );
  }
}
