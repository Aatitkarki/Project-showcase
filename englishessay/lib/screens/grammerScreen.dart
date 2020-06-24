import 'package:flutter/material.dart';

class GrammerSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("This feature is coming soon..."),
            CircularProgressIndicator()
          ],
        ),
      ),
      
    );
  }
}