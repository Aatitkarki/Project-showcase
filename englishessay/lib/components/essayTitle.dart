import 'package:flutter/material.dart';

class EssayTitle extends StatelessWidget {
  final String title;

  const EssayTitle({this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      // borderRadius: BorderRadius.circular(),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.red,
            child: Text("E"),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Container(
              child: Text(
                title,
                textAlign: TextAlign.start,
                overflow: TextOverflow.fade,
                style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}