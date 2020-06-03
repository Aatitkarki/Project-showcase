import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'exercise.dart';

class DBhelper{
  static Database _db;
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String SOURCE = 'source';

  static const String TABLE = 'ExerciseTable';
  static const String DB_NAME = 'exercise.db'; 

  Future <Database> get db async{
    if(db!=null){
      return _db;
    }
    _db = await initDB();
    return _db;
  }
  initDB() async{
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
     String path = join(documentsDirectory.path,DB_NAME);
     var db = await openDatabase(path,version: 1,onCreate: _onCreate);
     return db;
  }
  _onCreate(Database db ,int version) async {
    await db.execute('CREATE TABLE $TABLE ($ID INTEGER, $NAME TEXT,$SOURCE TEXT)');
  }
}