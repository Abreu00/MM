import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await connect();
    return _database;
  }

  connect() async {
    return openDatabase(
    join( await getDatabasesPath(), 'reports.db'),

    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE reports(id INTEGER PRIMARY KEY, creation INTEGER, content Text)"
      );
    },
    version: 1,
    );
  }
}