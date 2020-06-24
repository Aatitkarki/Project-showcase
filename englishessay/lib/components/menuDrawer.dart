import 'package:englishessay/Model/themeProvider.dart';
import 'package:englishessay/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.height ,
      width: MediaQuery.of(context).size.width * 0.8,
      color: kPrimaryColor,
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30,),
            CircleAvatar(
              backgroundColor: Colors.red,
              radius: 50,
              child: Text("S",style: kAvatarTextStyle,),
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text("Essays"),
                  leading: Icon(FontAwesomeIcons.bookOpen),
                ),
                ListTile(
                  title: Text("BookMark"),
                  leading: Icon(FontAwesomeIcons.bookmark),
                ),
                ListTile(
                  title: Text("Grammer"),
                  leading: Icon(FontAwesomeIcons.book),
                ),
                ListTile(
                  title: Text("DarkMode"),
                  trailing: Switch(value: themeChange.darkTheme, onChanged: (bool value){
                    themeChange.darkTheme = value;
                  }),
                  leading: Icon(FontAwesomeIcons.book),
                ),

              ],
            )
          ],
        ),
      ),
      
    );
  }
}