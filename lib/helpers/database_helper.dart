import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/event_details.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'events.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE events(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        description TEXT,
        title Text,
        date TEXT
      )
    ''');
  }

  Future<int> insertExpense(EventDetails expense) async {
    final db = await database;
    return await db.insert('events', expense.toMap());
  }

  Future<List<EventDetails>> getevents() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('events');
    return List.generate(maps.length, (i) {
      return EventDetails.fromMap(maps[i]);
    });
  }

  Future<int> deleteExpense(int id) async {
    final db = await database;
    return await db.delete('events', where: 'id = ?', whereArgs: [id]);
  }
}
