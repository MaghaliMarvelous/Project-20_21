import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _database;


  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'contacts.db');


    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE contacts(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          )
        ''');
      },
    );
  }


  Future<int> insertName(String name) async {
    final db = await database;
    return await db.insert('contacts', {'name': name});
  }


  Future<List<Map<String, dynamic>>> getNames() async {
    final db = await database;
    return await db.query('contacts', orderBy: 'id DESC');
  }


  Future<int> deleteById(int id) async {
    final db = await database;
    return await db.delete('contacts', where: 'id = ?', whereArgs: [id]);
  }


  Future<int> updateById(int id, String newName) async {
    final db = await database;
    return await db.update(
      'contacts',
      {'name': newName},
      where: 'id = ?',
      whereArgs: [id],
    );
  }


  Future<void> closeDb() async {
    final db = await database;
    await db.close();
    _database = null;
  }
}
