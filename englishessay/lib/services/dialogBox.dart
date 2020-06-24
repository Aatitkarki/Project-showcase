import 'package:englishessay/constants.dart';
import 'package:flutter/material.dart';

class AlertingData{
 void showDialogBox(BuildContext context,String title,String message){
    showDialog(context: context,builder:(BuildContext context) {
      return AlertDialog(
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40)
        ),
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          FlatButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("CLOSE"))
        ],
      );
    });
  }
  bool showBox(BuildContext context,String title,String message){
    showDialog(context: context,builder:(BuildContext context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(          
          borderRadius: BorderRadius.circular(40)
        ),
        title: Text(title,style: kTitleStyle,),
        content: Text(message),
        actions: <Widget>[
          FlatButton(onPressed: (){            
            Navigator.pop(context);
          }, child: Text("CLOSE"))
        ],
      );
    });
    return true;
  }
}