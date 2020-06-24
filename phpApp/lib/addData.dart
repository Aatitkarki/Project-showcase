import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phpApp/main.dart';

class AddDataPage extends StatefulWidget {
  @override
  _AddDataPageState createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  TextEditingController nameController = new TextEditingController();
    TextEditingController mobileController = new TextEditingController();

  void addData()async{
    String name = "Suman";
    String mobile = "Karki";

    
    var url = "http://192.168.10.103/dashboard/myfolder/adddata.php";
    await http.post(url,body:{
      "first_name":name,
      "last_name":mobile
    });

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: "Enter Name",
              hintText: "Enter name"
              ),
          ),TextField(
            controller: mobileController,
            decoration: InputDecoration(
              labelText: "Enter Mobile",
              hintText: "Enter Mobile"
            ),
          ),
          RaisedButton(onPressed: (){
            addData();
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
            },
          child: Text("Add"),)
        ],
      ),
    );
  }
}