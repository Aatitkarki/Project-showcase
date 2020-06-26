import 'package:englishessay/Model/themeProvider.dart';
import 'package:englishessay/screens/welcomeScreen.dart';
import 'package:englishessay/services/databaseHelper.dart';
import 'package:englishessay/themeConstants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeProvider = new ThemeProvider();

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  void getCurrentAppTheme() async {
    themeProvider.darkTheme = await themeProvider.appTheme.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          FutureProvider(create: (context) => DatabaseHelper.db.getAllEssays()),
          ChangeNotifierProvider(create: (context) => DatabaseHelper()),
        ],
        child: ChangeNotifierProvider(create: (_) {
          return themeProvider;
        }, child: Consumer<ThemeProvider>(          
            builder: (BuildContext context, value, Widget child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeStyles.themeData(themeProvider.darkTheme, context),
            home:  WelcomeScreen(),
          );
        })));
  }
}
