import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'health_tracker.db');
    bool exists = await databaseExists(path);

    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
        ByteData data = await rootBundle.load('assets/health_tracker.db');
        List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await File(path).writeAsBytes(bytes, flush: true);
      } catch (e) {
        print("Error copying database: $e");
      }
    }
    
    return openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE IF NOT EXISTS steps(id INTEGER PRIMARY KEY, step_count INTEGER, date TEXT)",
        );
        await db.execute(
          "CREATE TABLE IF NOT EXISTS meals(id INTEGER PRIMARY KEY, water INTEGER)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertStepCount(int stepCount, String date) async {
    final db = await database;
    await db.insert(
      'steps',
      {'step_count': stepCount, 'date': date},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Map<String, dynamic>?> getStepCountForDate(String date) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'steps',
      where: 'date = ?',
      whereArgs: [date],
    );
    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }

  Future<void> insertWater(int water) async {
    final db = await database;
    await db.insert(
      'meals' ,
      {'water': water}, 
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> getWater() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('meals');

    if (maps.isNotEmpty) {
      return maps.first['water'] as int;
    } else {
      return 0;
    }
  }
}
