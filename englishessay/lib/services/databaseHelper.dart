import 'dart:io';
import 'package:englishessay/Model/essay.dart';
import 'package:englishessay/services/essayService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper with ChangeNotifier {
  static Database _database;
  //private constructor of the databasehelper
  static final DatabaseHelper db = DatabaseHelper();

  // DatabaseHelper();

  Future<Database> get database async {
    // If database exists, return database
    if (_database != null) return _database;
    // If database don't exists, create one
    _database = await initDB();
    return _database;
  }
  String sql1 = "CREATE TABLE ESSAY ("
          "id INTEGER PRIMARY KEY,"
          "title VARCHAR(40),"
          "createdDate TEXT,"
          "essayData TEXT,"
          "author VARCHAR(40),"
          "bookmark TINYINT"
          ")";

  String sql2 = "CREATE TABLE UserData ("
          "id INTEGER PRIMARY KEY,"
          "username VARCHAR(40),"
          "email VARCHAR(40),"
          "password VARCHAR(40),"
          ")";
  // Create the database and the Employee table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "essaydb.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(sql1);
    });
  }

  // Insert Essay on database
  createEssayData(Essay essay) async {
    final db = await database;
    final res = await db.insert('ESSAY', essay.toJson());
    return res;
  }


  // Delete all Essays
  Future<int> deleteAllEssays() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM ESSAY');
    return res;
  }

  //Getting data from database
  Future<List<Essay>> getAllEssays() async {
    EssayService essayService = new EssayService();
    final db = await database;
    List<Essay> list;
    final res = await db.rawQuery("SELECT * FROM ESSAY");
    if (res.isNotEmpty) {
      list = res.map((result) => Essay.fromMap(result)).toList();
    } else {
      await essayService.getDataFromAPI();
      final res = await db.rawQuery("SELECT * FROM ESSAY");
      if (res.isNotEmpty) {
        list = res.map((c) => Essay.fromMap(c)).toList();
      }
    }
    return list;
  }

  Future<void> updateBookmark(int id, int bookmarkstatus) async {
    final db = await database;
    await db
        .rawQuery("UPDATE ESSAY SET BOOKMARK =$bookmarkstatus WHERE ID = $id");
    notifyListeners();
  }

  Future<List<Essay>> bookMarkData() async {
    final db = await database;
    List<Essay> bookmarkEssay;
    final res = await db.rawQuery("SELECT * FROM ESSAY WHERE bookmark=1");
    if (res.isNotEmpty) {
      bookmarkEssay = res.map((result) => Essay.fromMap(result)).toList();
    } else {
      bookmarkEssay = null;
    }
    notifyListeners();
    return bookmarkEssay;
  }

  //search data
  Future<List<Essay>> searchData(String data) async {
    final db = await database;
    List<Essay> resultData;
    final res =
        await db.rawQuery("SELECT * FROM ESSAY WHERE title LIKE '%$data%'");

    if (res.isNotEmpty) {
      resultData = res.map((result) => Essay.fromMap(result)).toList();
    } else {
      resultData = null;
    }
    return resultData;
  }
}
