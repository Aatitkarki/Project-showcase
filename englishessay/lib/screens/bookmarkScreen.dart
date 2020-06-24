import 'package:englishessay/Model/essay.dart';
import 'package:englishessay/components/essayTitles.dart';
import 'package:englishessay/constants.dart';
import 'package:englishessay/services/databaseHelper.dart';
import 'package:flutter/material.dart';

class BookmarkScreen extends StatefulWidget {
  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  List<Essay> essayList;
  bool isLoading = true;
  bool emptyBookmark = false;

  getData() async {
    essayList = await DatabaseHelper.db.bookMarkData();
    setState( () {
      if(essayList!=null){
        isLoading = false;
      }else{
        emptyBookmark = true;
      }
      
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Bookmarked Essays",style: kAppBarTitleStyle,),
        centerTitle: true,        
      ),
          body: SafeArea(
          child: essayList == null
          
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      emptyBookmark ? Column(
                        children: <Widget>[
                          Text("OOPS!",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          Text("NO BOOKMARKED ESSAYS",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          Text("😞",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),                        
                        ],
                      ) : CircularProgressIndicator()                    
                    ],
                  ),
                )
              : Padding(
                padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 10),
                child: Container(
                  height: size.height,
                  width: double.infinity,
                  child: Column(
    
                    children: <Widget>[
                      EssayTitleCard(
                          essayList: essayList,
                        ),
                    ],
                  ),
                ),
              )),
    );
  }
}
