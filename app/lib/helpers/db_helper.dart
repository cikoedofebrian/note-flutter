import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'notes.db'),
      onCreate: (db, version) => db.execute(
          'CREATE TABLE notes(id TEXT PRIMARY KEY, title TEXT, content TEXT, date TEXT, color BIGINT)'),
      version: 1,
    );
  }

  static Future<void> insert(Map<String, dynamic> data) async {
    final db = await DBHelper.database();
    db.insert('notes', data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final db = await DBHelper.database();
    return db.query('notes');
  }

  static Future<void> delete(String id) async {
    final db = await DBHelper.database();
    db.rawDelete("DELETE FROM notes WHERE id = '$id'");
  }

  static Future<void> update(String id, String content) async {
    final db = await DBHelper.database();
    db.rawUpdate("UPDATE notes SET content = '$content' WHERE id = '$id'");
  }
}
