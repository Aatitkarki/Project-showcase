import 'package:englishessay/Model/themeProvider.dart';
import 'package:englishessay/constants.dart';
import 'package:englishessay/screens/bookmarkScreen.dart';
import 'package:englishessay/screens/homePage.dart';
import 'package:englishessay/screens/loginScreen.dart';
import 'package:englishessay/services/userInOut.dart';
import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<Widget> tabs = [HomePage(), BookmarkScreen(),];
  int _currentIndex = 0;
  String username="user";
  String email="email";

  getUserData()async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    username =prefs.getString("username");
    email = prefs.getString("email");
    print(username);
    print(email);
  }

  @override
  void initState() {
    getUserData();
    setState(() {
      
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);
    Future<bool> _callExitApp() {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Do you want to Exit App?"),
                actions: <Widget>[
                  FlatButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text("No")),
                  FlatButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: Text("Yes"))
                ],
              ));
    }

    return WillPopScope(
      onWillPop: _callExitApp,
      child: Scaffold(
        drawer: Drawer(
            child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(username),
              accountEmail: Text(email),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Text(
                  username.substring(0, 1).toUpperCase(),
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Essays"),
              leading: Icon(
                FontAwesomeIcons.bookOpen,
                color: kPrimaryColor,
              ),
            ),
            ListTile(
              title: Text("BookMark"),
              leading: Icon(
                FontAwesomeIcons.solidBookmark,
                color: kPrimaryColor,
              ),
            ),
            ListTile(
              title: Text("Grammer"),
              leading: Icon(
                FontAwesomeIcons.book,
                color: kPrimaryColor,
              ),
            ),
            ListTile(
              title: Text(
                "DarkMode",
              ),
              trailing: Switch(
                  value: themeChange.darkTheme,
                  onChanged: (bool value) {
                    themeChange.darkTheme = value;
                  }),
              leading: Icon(
                FontAwesomeIcons.book,
                color: kPrimaryColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                UserControl().userLogOut();

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: ListTile(
                leading: Icon(FontAwesomeIcons.user),
                title: Text("Log Out"),
              ),
            )
          ],
        )),
        body: tabs[_currentIndex],
        bottomNavigationBar: FFNavigationBar(
          theme: FFNavigationBarTheme(
            barBackgroundColor: Colors.white,
            selectedItemBorderColor: Colors.transparent,
            selectedItemBackgroundColor: Color(0xff3E2B6C),
            selectedItemIconColor: Colors.white,
            unselectedItemIconColor: Color(0xff112e2b),
            unselectedItemLabelColor: Color(0xff712db5),
            unselectedItemTextStyle: TextStyle(color: Colors.black),
            selectedItemLabelColor: Colors.black,
          ),
          selectedIndex: _currentIndex,
          onSelectTab: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            FFNavigationBarItem(
              iconData: Icons.home,
              label: 'Home',
            ),
            FFNavigationBarItem(
              iconData: Icons.bookmark,
              label: 'BookMark',
            ),
          ],
        ),
      ),
    );
  }
}
