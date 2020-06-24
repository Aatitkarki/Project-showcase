import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phpApp/addData.dart';
import 'package:phpApp/details.dart';

void main() {
  runApp(MaterialApp(
    title: "My App",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url = "http://192.168.10.103/dashboard/myfolder/getdata.php";
  StreamController _streamController;
    
  Stream _stream;

  @override
  void initState() {
    super.initState();
    // _streamController = StreamController();
    // _stream = _streamController.stream;
    // getStreamData();
  }

  getStreamData() async {
    http.Response response = await http.get(url);
    final data = json.decode(response.body);
    print(data);
    _streamController.add(data);
  }

  // Future<List> getData() async {
  //   final response = await http.get(url);
  //   final data = json.decode(response.body);
  //   print(data);
  //   return data;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My App"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddDataPage())),
          child: Icon(Icons.add),
        ),
        body: AddDataPage()
        // FutureBuilder<List>(
        //   future: getData(),
        //   // initialData: InitialData,
        //   builder: (BuildContext context, AsyncSnapshot snapshot) {
        //   if (snapshot.hasError) {
        //     print("error");
        //   }
        //   if (snapshot.hasData) {
        //     return Items(
        //       list: snapshot.data,
        //     );
        //   } else {
        //     return Center(
        //         child: Column(
        //       children: <Widget>[
        //         CircularProgressIndicator(),
        //       ],
        //     ));
        //   }
        // },
        // ),
        );
  }
}

class Items extends StatelessWidget {
  final List list;
  Items({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Icon(Icons.message),
          title: Text(list[index]["name"]),
          subtitle: Text(list[index]["mobile"]),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Details(list: list, index: index))),
        );
      },
    );
  }
}
