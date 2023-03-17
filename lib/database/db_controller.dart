import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbController {
  static final DbController _instance = DbController._();
  late Database _database;

  DbController._();

  factory DbController() {
    return _instance;
  }

  Database get database => _database;

  Future<void> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'app_db.sql');
    _database = await openDatabase(path, version: 1, onOpen: (Database db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE users('
          'id INTEGER UNSIGNED AUTO_INCREMENT,'
          'title TEXT NOT NULL,'
          'email TEXT NOT NULL,'
          'password TEXT NOT NULL,'
          'PRIMARY KEY(id)'
          ')');

      await db.execute('CREATE TABLE notes('
          'id INTEGER UNSIGNED AUTO_INCREMENT,'
          'title TEXT NOT NULL,'
          'info TEXT NOT NULL,'
          'user_id INTEGER UNSIGNED,'
          'FOREIGN KEY(user_id) REFERENCES  users(id),'
          'PRIMARY KEY(id)'
          ')');
    },
        onUpgrade: (Database db, int oldVersion, int newVersion) {},
        onDowngrade: (Database db, int oldVersion, int newVersion) {});
  }
}
