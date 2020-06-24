import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final List list;
  final int index;

  const Details({this.list, this.index});
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  void confirm(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]["name"]}"),
      ),
      body: Container(
        child:Column(
          children: <Widget>[
            Text(
              widget.list[widget.index]["name"],
              style: TextStyle(fontSize: 20),
            ),
            Text(
              widget.list[widget.index]["mobile"],
            ),
            MaterialButton(onPressed: (){},
            child:Text("Edit"),
            color: Colors.deepOrangeAccent
            ),
            MaterialButton(onPressed: ()=>confirm(),
            child:Text("Delete"),
            color: Colors.deepOrangeAccent
            )
          ],
        )
      ),
    );
  }
}