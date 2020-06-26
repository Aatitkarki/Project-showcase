import 'package:englishessay/Model/themeProvider.dart';
import 'package:englishessay/constants.dart';
import 'package:englishessay/screens/aboutDeveloper.dart';
import 'package:englishessay/screens/bookmarkScreen.dart';
import 'package:englishessay/screens/essayList.dart';
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
  List<Widget> tabs = [
    HomePage(),
    BookmarkScreen(),
  ];
  int _currentIndex = 0;
  String username;
  String email;

  getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString("username");
    email = prefs.getString("email");
    setState(() {});
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);
    Future<bool> _callExitApp() {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                elevation: 10,
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
              accountName: Text(username == null ? "Guest" : username),
              accountEmail: Text(email == null ? "guest@gmail.com" : email),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: username == null
                    ? Text("G")
                    : Text(
                      
                        username.substring(0, 1).toUpperCase(),
                        style: TextStyle(fontSize: 40.0),
                      ),
              ),
            ),
            SizedBox(height:30),
            DrawerMenu( 
              title: "Essays",
              icon: FontAwesomeIcons.bookOpen,
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EssayList()));
                    
              },
            ),
            DrawerMenu(
              title: "BookMark",
              icon: FontAwesomeIcons.solidBookmark,
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BookmarkScreen()));
              },
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
                FontAwesomeIcons.sun,
                color: kPrimaryColor,
              ),
            ), DrawerMenu( 
              title: "About Developer",
              icon: FontAwesomeIcons.dev,
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutDeveloper()));
              },
            ),
            DrawerMenu(
              title: "Log Out",
              icon: FontAwesomeIcons.user,
              press: () {
                UserControl().userLogOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
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

class DrawerMenu extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function press;
  const DrawerMenu({this.icon, this.title, this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: ListTile(
        leading: Icon(
          icon,
          color: kPrimaryColor,
        ),
        title: Text(title,style: TextStyle(fontSize: 16),),
      ),
    );
  }
}
