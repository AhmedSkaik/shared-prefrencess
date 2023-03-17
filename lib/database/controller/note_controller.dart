import 'package:sherd_pref_app/Modals/Note.dart';
import 'package:sherd_pref_app/database/db_operation.dart';

class NoteController extends DbOperation<Note> {
  @override
  Future<int> create(Note model) async {
    // int newRowId = await database.rawInsert('INSERT INTO notes (title, info ,user_id ) VALUES(?,?,?)',[model.title, model.info,model.UserId]);

    int newRowId = await database.insert('notes', model.toMap());
    return newRowId;
  }

  @override
  Future<bool> delete(Note model) async {
    // int countOfdeletedRows = await database.rawDelete('DELETE FROM notes WHERE id = ?',[id]);
    int countOfDeletedRows =
        await database.delete('notes', where: 'id = ?', whereArgs: [model.id]);
    return countOfDeletedRows > 0;
  }

  @override
  Future<List<Note>> read() async {
    List<Map<String, dynamic>> rowMaps =
        await database.rawQuery('SELECT * FROM notes ');
    return rowMaps.map((rowMap) => Note.fromMap(rowMap: rowMap)).toList();
  }

  @override
  Future<Note?> show(int id) async {
    List<Map<String, dynamic>> rowMaps =
        await database.query('notes', where: 'id =?', whereArgs: [id]);
    return rowMaps.isNotEmpty ? Note.fromMap(rowMap:rowMaps.first) : null;
  }

  @override
  Future<bool> update(Note model) async {
    int countOfUpdatedRows = await database.rawUpdate(
        'UPDATE notes SET title= ? , info = ?, WHERE id = ?',
        [model.title, model.info]);
    return countOfUpdatedRows > 0;
  }
}
