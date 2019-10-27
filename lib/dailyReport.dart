import 'dart:async';
import 'db.dart';
import 'package:sqflite/sqflite.dart';

class DailyReport {
  int id;
  int creation; // As unix time
  String content;

  DailyReport({this.id, this.creation, this.content});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'creation': creation,
      'content': content,
    };
  }


  Future<void> insertReport() async {
    
    this.creation = new DateTime.now().millisecondsSinceEpoch;
    final Database db = await DBProvider.db.database;

    await db.insert('reports', this.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);

  }

  static Future<List<DailyReport>> reports() async {
    final Database db = await DBProvider.db.database;
    final List<Map<String, dynamic>> maps = await db.query('reports');

    return List.generate(maps.length, (i) {
      return DailyReport(
        id: maps[i]['id'],
        content: maps[i]['content'],
        creation: maps[i]['creation'],
      );
    });
  }
}
