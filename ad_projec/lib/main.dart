import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

const String testDevice = 'Mobile_id';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice!= null ? <String>[testDevice] : null,
    nonPersonalizedAds: true,
    keywords: <String>["book","game","essay"]
  );

  BannerAd _bannerAd;
  BannerAd createBannerAd(){
    return BannerAd(adUnitId: BannerAd.testAdUnitId, size: AdSize.fullBanner,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event){
      print("BannerAd $event");
    });
  }
@override
  void initState() {    
    FirebaseAdMob.instance.initialize(appId: BannerAd.testAdUnitId);
    _bannerAd = createBannerAd()..load()..show();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Text("THis is a text ")
            ],
          ),
        ),
      ),
      
    );
  }
}