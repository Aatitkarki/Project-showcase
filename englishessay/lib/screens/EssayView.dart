import 'package:englishessay/Model/essay.dart';
import 'package:englishessay/constants.dart';
import 'package:englishessay/services/databaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EssayView extends StatefulWidget {
  final Essay essaydata;

  const EssayView({ this.essaydata,
  });

  @override
  _EssayViewState createState() => _EssayViewState();
}

class _EssayViewState extends State<EssayView> {
  int bookmarkStatus;
  @override
  void initState() {
    bookmarkStatus = widget.essaydata.bookmark;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var bookmarkUpdate = Provider.of<DatabaseHelper>(context);

    int getStatus() {
      int data;
      if (bookmarkStatus == 0) {
        data = 1;
        setState(() {
          bookmarkStatus = 1;
        });
        return data;
      } else {
        data = 0;
        setState(() {
          bookmarkStatus = 0;
        });
        return data;
      }
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: size.height * 0.15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 30,
                              color: kPrimaryColor,
                            ),
                            onPressed: () {
                              Navigator.pop(context, true);
                            }),
                        Flexible(
                            child: Text(
                          widget.essaydata.title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                        IconButton(
                            icon: Icon(
                              bookmarkStatus == 0
                                  ? Icons.bookmark_border
                                  : Icons.bookmark,
                              size: 30,
                              color: Theme.of(context).accentColor,
                            ),
                            onPressed: () async{
                             await bookmarkUpdate.updateBookmark(widget.essaydata.id, getStatus());
                              setState(() {
                                print("bookmark status changed");
                              });
                              //changeStatus();
                            }),
                      ],
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      "Author: ${widget.essaydata.author}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.essaydata.essayData,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
