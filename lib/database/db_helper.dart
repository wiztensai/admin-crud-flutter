import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:admin_crud_flutter/model/model_country.dart';
import 'db_country.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  String tableName = "country";

  DbHelper._createObject();

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }

  final tables = [
    DbCountry.CREATE_TABLE
  ];

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '${tableName}.db';

    return openDatabase(path, version: 1, onCreate: _createDb);
  }

  void _createDb(Database db, int version) async {
    tables.forEach((string) async {
      await db.execute(string);
    });
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }
}
