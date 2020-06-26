import 'package:connectivity/connectivity.dart';
import 'package:englishessay/services/dialogBox.dart';
import 'package:flutter/cupertino.dart';

class NetworkChecker{  
 Future<bool> checkConnection(BuildContext context) async {
   AlertingData alertingData = new AlertingData();
    var result = await Connectivity().checkConnectivity();
    if(result == ConnectivityResult.wifi || result == ConnectivityResult.mobile){
      return true;
    }else if(result == ConnectivityResult.none){
      alertingData.showDialogBox(context, "NO internet", "Please connect to the internet.");
    }
    return false;
  }
}