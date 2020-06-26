import 'dart:io';
class AdmobService{

  String getAdMobAppId(){
    if(Platform.isAndroid){
      return "ca-app-pub-1181492247529937~8396875598";
    }else{
      return null;
    }
  }

  String getBannerAppId(){
    if(Platform.isAndroid){
      return "ca-app-pub-1181492247529937/5770712250";
    }else{
      return null;
    }
  }
}