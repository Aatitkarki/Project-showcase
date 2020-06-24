import 'dart:io';

class AdmobService{

  String getAdMobAppID(){
    if(Platform.isAndroid){
      return 'ca-app-pub-1181492247529937~7661356920';
    }else return null;
  }

  String getBannerAdID(){
    if(Platform.isAndroid){
      return 'ca-app-pub-1181492247529937/3472143552';
    }
    else return null;
  }
}