import 'dart:ui';

import 'package:englishessay/Model/essay.dart';
import 'package:englishessay/components/essayTitles.dart';
import 'package:englishessay/screens/searchedEssayScreen.dart';
import 'package:englishessay/services/databaseHelper.dart';
import 'package:englishessay/services/dialogBox.dart';
import 'package:englishessay/services/essayService.dart';
import 'package:englishessay/services/networkChecker.dart';
import 'package:flutter/material.dart';

class EssayList extends StatefulWidget {
  @override
  _EssayListState createState() => _EssayListState();
}

class _EssayListState extends State<EssayList> {
  List <Essay> essayList;
  EssayService essayService;
  TextEditingController searchDataController;
  NetworkChecker networkChecker ;
  AlertingData alertingData;
  bool isLoading=true;


  @override
  void initState() {
getData();
    alertingData = new AlertingData();
    essayService = new EssayService();
    searchDataController = new TextEditingController();
    networkChecker = new NetworkChecker();
    super.initState();
  }

  getData() async {
    essayList = await DatabaseHelper.db.getAllEssays();
    setState(() {
      isLoading = false;
    });
  }
  
  Future<void> searchData(String queryData) async{
    if(queryData.trim()==""){
      alertingData.showBox(context, "Empty Field", "Please input some text to search");

    }else{
       var responseData =await DatabaseHelper.db.searchData(queryData);
    if(responseData==null){
      alertingData.showDialogBox(context,"No data found","Sorry We are unable to find the essay you searched!");
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SpecificEssays(essayList: responseData,title: "Search Results",)));
    }

    }   
  }  

  Future<void> reloadData(BuildContext context) async {
  bool networkStatus= await networkChecker.checkConnection(context);
  
  if(networkStatus){
    setState(() {
    isLoading = true;
  });
    var dataAccessed =  await essayService.getDataFromAPI();
    if(dataAccessed){
      alertingData.showDialogBox(context, "Essay Updated", "Your essay is updated with latest Data");

    }else{
      alertingData.showDialogBox(context, "OOPS", "Sorry we are unable to update the latest essay from our Server.");

    }
    setState(() {
    isLoading = false;
  });
  }    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7E7469),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                child: Container(
                  height: 170,
                  decoration: BoxDecoration(
                    color: Color(0xff18338c),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text(
                      "Essays",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    GestureDetector(
                        onTap: () {
                          reloadData(context);
                        },
                        child: Icon(
                          Icons.refresh,
                          color: Colors.white,
                          size: 30,
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 10,
                  ),
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: <Widget>[
                      TextField(
                        controller: searchDataController,
                        selectionWidthStyle: BoxWidthStyle.tight,
                        decoration: InputDecoration(
                          hintText: 'Search Essay here...',
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white70,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(width: 2),
                          ),
                        ),
                      ),
                      IconButton(icon: Icon(Icons.search),autofocus:false , onPressed: (){
                        
                        searchData(searchDataController.text);
                      }),
                    ],
                  ),
                  
                ),
                SizedBox(
                  height: 10,
                ),
                isLoading
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
          ),
        ],
      ),
    );
  }
}

