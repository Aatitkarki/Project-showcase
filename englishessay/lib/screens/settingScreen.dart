import 'package:englishessay/Model/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: size.height,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            FlatButton(onPressed: (){
                
            }, child: Text("Log Out")),
            RaisedButton(onPressed: (){
              themeChange.darkTheme = !themeChange.darkTheme;

            },child: Text("Change Theme"),)

          ],
        ),
      ),
    );
  }
}
