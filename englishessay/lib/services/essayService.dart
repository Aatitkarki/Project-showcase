import 'dart:convert';
import 'package:englishessay/Model/essay.dart';
import 'package:englishessay/services/databaseHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EssayService with ChangeNotifier {
  String essayListUrl = "https://sureshkarki.000webhostapp.com/essay/essayData.php" ;
  

  Future<bool> getDataFromAPI() async {
    List dataList;
    List<Essay> essayList;
    try {
      var response = await http.get(essayListUrl);
      if (response.statusCode == 200) {
        await DatabaseHelper.db.deleteAllEssays();
        dataList = await jsonDecode(response.body);
        essayList = dataList.map((essay) => Essay.fromJson(essay)).toList();
        for (int i = 0; i < essayList.length; i++) {
          await DatabaseHelper.db.createEssayData(essayList[i]);
        }
        return true;
      } else {
        return false;
      }
    } catch (_) {
      return false;
    }
  }
}
