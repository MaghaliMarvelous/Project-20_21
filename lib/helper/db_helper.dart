import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/todo.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'todo_list.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE todos(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            category TEXT,
            startTime TEXT,
            endTime TEXT,
            isDone INTEGER
          )
        ''');
      },
    );
  }

  Future<int> insertTodo(Todo todo) async {
    final client = await db;
    return await client.insert('todos', {
      'title': todo.title,
      'description': todo.description,
      'category': todo.category,
      'startTime': todo.startTime,
      'endTime': todo.endTime,
      'isDone': todo.isDone ? 1 : 0,
    });
  }

  Future<List<Todo>> getTodos() async {
    final client = await db;
    final maps = await client.query('todos', orderBy: 'id DESC');

    return maps.map((map) => Todo(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      startTime: map['startTime'] as String,
      endTime: map['endTime'] as String,
      isDone: (map['isDone'] as int) == 1,
    )).toList();
  }

  Future<int> updateTodo(Todo todo) async {
  final client = await db;
  return await client.update(
    'todos',
    {
      'title': todo.title,
      'description': todo.description,
      'category': todo.category,
      'startTime': todo.startTime,
      'endTime': todo.endTime,
      'isDone': todo.isDone ? 1 : 0,
    },
    where: 'id = ?',
    whereArgs: [todo.id],
  );
}


  Future<int> deleteTodo(int id) async {
    final client = await db;
    return await client.delete(
      'todos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> updateTodoDoneStatus(int id, bool isDone) async {
    final client = await db;
    return await client.update(
      'todos',
      {'isDone': isDone ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> closeDb() async {
    final client = await db;
    await client.close();
  }
}