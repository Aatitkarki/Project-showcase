import 'package:englishessay/Model/essay.dart';
import 'package:englishessay/components/essayTitles.dart';
import 'package:englishessay/constants.dart';
import 'package:englishessay/services/admobService.dart';
import 'package:englishessay/services/databaseHelper.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

const String testDevice = 'Mobile_id';

class BookmarkScreen extends StatefulWidget {
  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
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
  List<Essay> essayList;
  bool isLoading = true;
  bool emptyBookmark = false;
  //final ams = AdmobService();
  //BannerAd bannerAd;

  // BannerAd createBannerAd(){
  //   return BannerAd(adUnitId: ams.getBannerAppId(), size: AdSize.fullBanner,
  //   listener: (MobileAdEvent mae){
  //     print("banner ad $mae");
  //   }
  //   );
  // }

  getData() async {
    essayList = await DatabaseHelper.db.bookMarkData();
    setState( () {
      if(essayList!=null){
        isLoading = false;
      }else{
        emptyBookmark = true;
      }
      
    });
  }



  @override
  void initState() {    
    FirebaseAdMob.instance.initialize(appId: BannerAd.testAdUnitId);
    _bannerAd = createBannerAd()..load()..show();
   //  bannerAd = createBannerAd()..load()..show();

    getData();    
    super.initState();
  }
  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Bookmarked Essays",style: kAppBarTitleStyle,),
        centerTitle: true,        
      ),
          body: SafeArea(
          child: Column(
            children: <Widget>[
              essayList == null
              
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          emptyBookmark ? Column(
                            children: <Widget>[
                              Text("OOPS!",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              Text("NO BOOKMARKED ESSAYS",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              Text("😞",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),                        
                            ],
                          ) : CircularProgressIndicator()                    
                        ],
                      ),
                    )
                  : Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 10),
                    child: Container(
                      height: size.height,
                      width: double.infinity,
                      child: Column(
    
                        children: <Widget>[
                          EssayTitleCard(
                              essayList: essayList,
                            ),
                        ],
                      ),
                    ),
                  ),
                 // AdmobBanner(adUnitId: ams.getBannerAppId(), adSize: AdmobBannerSize.FULL_BANNER),

            ],
          )),
    );
  }
}
