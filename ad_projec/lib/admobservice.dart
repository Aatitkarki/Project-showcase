import 'dart:io';

class AdmobService{

  String getAdMobAppID(){
    if(Platform.isAndroid){
      print("returning admobid");
      return 'ca-app-pub-1181492247529937~7661356920';
      
    }
    else{
print("couldnot return admob id");
 return null;
    }
  }

  String getBannerAdID(){
    if(Platform.isAndroid){
      print("returning bannerid");
      return 'ca-app-pub-1181492247529937/3472143552';
    }
    else{
print("couldnot return banner id");
 return null;
    } 
  }
}