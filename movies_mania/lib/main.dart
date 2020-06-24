import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_mania/testingplayer.dart';
import 'package:movies_mania/videoPlayer.dart';
//import 'package:movies_mania/videoPlayer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ChewieDemo(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List moviesData;
  bool isLoading = true;
  String southMovieUrl =
      "https://sureshkarki.000webhostapp.com/SouthMovies.php";

  Future<List> getData() async {
    var response = await http.get(southMovieUrl);
    var data = response.body;
    moviesData = jsonDecode(data);
    print(moviesData);
    print("the length is ${moviesData.length}");
    setState(() {
      isLoading = false;
    });
    return moviesData;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies Mania"),
        centerTitle: true,
      ),
      body: 
        isLoading
          ? CircularProgressIndicator()
          : Center(
              child: Expanded(
                  child: ListView.builder(
                    itemCount: moviesData.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          child: GestureDetector(
                            onTap: (){
                            //  Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoPlayer(id: moviesData[index]["videoID"],)));
                            },
                            child: Column(
                              children: <Widget>[
                                Image.network(
                                  "${moviesData[index]["thumbnail"]}",
                                  fit: BoxFit.fitWidth,
                                ),
                                Text(
                                  moviesData[index]["title"],
                                  style: TextStyle(fontSize: 24),
                                ),
                              ],
                            ),
                          ),
                      );
                    },
                  ),
              ),
            ),
    );
  }
}




