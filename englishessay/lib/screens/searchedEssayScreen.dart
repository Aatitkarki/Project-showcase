import 'package:englishessay/Model/essay.dart';
import 'package:englishessay/components/essayTitles.dart';
import 'package:flutter/material.dart';

class SpecificEssays extends StatelessWidget {
  final List<Essay> essayList;
  final String title;

  

  const SpecificEssays({Key key, this.essayList, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(essayList);
    return Scaffold(
      body: SafeArea(
              child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xff18338c),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10.0),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Flexible(
                          child: Center(
                            child: Text(
                              title,
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                essayList == null
                    ? Center(
                        child: Container(
                          height: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[CircularProgressIndicator()],
                          ),
                        ),
                      )
                    : EssayTitleCard(essayList: essayList),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
