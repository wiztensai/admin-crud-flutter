import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:admin_crud_flutter/model/model_country.dart';

class DbHelperCountry {
  static DbHelperCountry _dbHelper;
  static Database _database;
  String tableName = "country";

  DbHelperCountry._createObject();

  factory DbHelperCountry() {
    if (_dbHelper == null) {
      _dbHelper = DbHelperCountry._createObject();
    }
    return _dbHelper;
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '${tableName}.db';

    return openDatabase(path, version: 1, onCreate: _createDb);
  }

  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${tableName} (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT
      )
    ''');
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }

  Future<List<Map<String, dynamic>>> select() async {
      Database db = await this.database;
      var maplist = await db.query(tableName, orderBy: 'name');
      return maplist;
  }

  Future<int> insertWithId(Country country) async {
    Database db = await this.database;
    return db.insert(tableName, country.toMap());
  }

  Future<int> insert(Map<String, Object> data) async  {
    Database db = await this.database;
    return db.insert(tableName, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> delete(int id) async{
    Database db = await this.database;
    db.delete(tableName,where: 'id=?',whereArgs: [id]);
  }

  Future<int> update(Country country) async {
    Database db = await this.database;
    db.update(tableName, country.toMap(), where: 'id=?', whereArgs: [country.id]);
  }

  Future<List<Country>> getCountry() async {
    var countryMapList = await select();
    var countryLength = countryMapList.length;
    List<Country> countryList = [];
    for(int i = 0; i<countryLength ; i++) {
      countryList.add(Country.fromMap(countryMapList[i]));
    }
    return countryList;
  }
}
