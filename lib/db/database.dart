import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static String tableName = '';
  static String columnId = "id";
  static String columnItemName = "name";
  static String columnSpecialityName= "speciality_name";

  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  static Database _db;

   Future<Database> get getDb async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

   initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "searchData.db");
    var dbCreated = await openDatabase(path, version: 1, onCreate: _onCreate);
    return dbCreated;
  }

  void _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE if not exists $tableName("
        "$columnId INTEGER PRIMARY KEY, "
        "$columnItemName TEXT, "
        "$columnSpecialityName TEXT);");
  }

   Future<int> saveItem(data) async {
    var dbClient = await getDb;
    int rowsSaved = await dbClient.insert(tableName, data.toMap());
    return rowsSaved;
  }

  Future<List> getItems(name, speciality_name) async {
    var dbClient = await getDb;
    var result = await dbClient.rawQuery("SELECT * FROM $tableName where name = $name AND speciality_name = $speciality_name");
    return result.toList();
  }

  Future close() async {
    var dbClient = await getDb;
    dbClient.close();
  }
}