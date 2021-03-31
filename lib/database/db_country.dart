import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:admin_crud_flutter/model/model_country.dart';
import 'package:admin_crud_flutter/database/db_helper.dart';

class DbCountry {
  static const String tableName = "country";
  static const String CREATE_TABLE = '''
      CREATE TABLE country (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT
      )
    ''';
  DbHelper dbHelper = DbHelper();

  Future<List<Map<String, dynamic>>> select() async {
      Database db = await dbHelper.database;
      var maplist = await db.query(tableName, orderBy: 'name');
      return maplist;
  }

  Future<int> insertWithId(Country country) async {
    Database db = await dbHelper.database;
    return db.insert(tableName, country.toMap());
  }

  Future<int> insert(Map<String, Object> data) async  {
    Database db = await dbHelper.database;
    return db.insert(tableName, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> delete(int id) async{
    Database db = await dbHelper.database;
    db.delete(tableName,where: 'id=?',whereArgs: [id]);
  }

  Future<int> update(Country country) async {
    Database db = await dbHelper.database;
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
