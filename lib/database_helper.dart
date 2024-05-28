import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'health_tracker.db');
    return openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE IF NOT EXISTS meals(id INTEGER PRIMARY KEY, water INTEGER)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertWater(int water) async {
    final db = await database;
    await db.insert(
      'meals',
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
