import 'package:sherd_pref_app/Modals/User.dart';
import 'package:sherd_pref_app/database/db_operation.dart';
import 'package:sqflite_common/sqlite_api.dart';

class UserController extends DbOperation<User> {
  @override
  Future<int> create(User model) async {
    int newRowId = await database.insert('users', model.toMap());
    return newRowId;
  }

  @override
  Future<bool> delete(User model) async {
    int countDeletedRows =
        await database.delete('users', where: 'id= ?', whereArgs: [model.id]);
    return countDeletedRows > 0;
  }

  @override
  Future<List<User>> read() async {
    List<Map<String, dynamic>> rowMaps = await database.query('users');
    return rowMaps.map((rowMap) => User.fromMap(rowMap: rowMap)).toList();
  }

  @override
  Future<User?> show(int id) async {
    List<Map<String, dynamic>> rowMaps =
        await database.query('users', where: 'id =?', whereArgs: [id]);
    return rowMaps.isNotEmpty ? User.fromMap(rowMap: rowMaps.first) : null;
  }

  @override
  Future<bool> update(User model) async {
    int countOfUpdatesRows = await database
        .update('users', model.toMap(), where: 'id=?', whereArgs: [model.id]);
    return countOfUpdatesRows > 0;
  }
}
