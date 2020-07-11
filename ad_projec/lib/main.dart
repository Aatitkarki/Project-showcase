import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';
void main() {
  runApp(MyApp());
}

const String testDevice = 'DE380AFFA46CFC5064DD762753F4ED3C';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    
    testDevices: testDevice!= null ? <String>[testDevice] : null,
      
    keywords: <String>["book","game","essay"]
  );

  BannerAd _bannerAd;
  InterstitialAd interstitialAd;
  BannerAd createBannerAd(){
    return BannerAd(adUnitId: "ca-app-pub-1181492247529937/3472143552", size: AdSize.banner,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event){
      if(event ==MobileAdEvent.loaded){
        print("adds is loaded");
      }
      print("BannerAd $event");
    });
  }

  InterstitialAd createInterstitialAd(){
    return InterstitialAd(adUnitId: BannerAd.testAdUnitId,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event){
      if(event ==MobileAdEvent.loaded){
        print("adds is loaded");
      }
      print("BannerAd $event");
    });
  }
@override
  void initState() {    
    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-1181492247529937~7661356920");
    _bannerAd = createBannerAd()..load()..show();
    interstitialAd = createInterstitialAd()..load()..show();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold( 
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("THis is a text ")
            ],
          ),
        ),
      ),
      
    );
  }
}