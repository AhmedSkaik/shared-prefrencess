import 'package:flutter/cupertino.dart';
import 'package:sherd_pref_app/Modals/Note.dart';
import 'package:sherd_pref_app/Modals/process_response.dart';
import 'package:sherd_pref_app/database/controller/note_controller.dart';

class NoteProvider extends ChangeNotifier {
  final NoteController _dbController = NoteController();
  List<Note> notes = <Note>[];

  Future<ProcessResponse> createNotes({required Note note}) async {
    int newRowId = await _dbController.create(note);
    if (newRowId != 0) {
      note.id = newRowId;
      notes.add(note);
      notifyListeners();
    }
    return ProcessResponse(
        massege: newRowId != 0 ? 'note created succefully' : 'field',
        success: newRowId != 0);
  }

  Future<void> readNotes() async {
    notes = await _dbController.read();
    notifyListeners();
  }

  Future<ProcessResponse> updateNotes({required Note updatednote}) async {
    bool updated = await _dbController.update(updatednote);
    if (updated) {
      int index = notes.indexWhere((Note note) => note.id == updatednote.id);
      if (index != -1) {
        notes[index] = updatednote;
        notifyListeners();
      }
    }
    return ProcessResponse(
        massege: updated ? 'note updated succefully' : 'field',
        success: updated);
  }

  Future<ProcessResponse> deleteNotes({required int index}) async {
    bool deleted = await _dbController.delete(notes[index]);
    if(deleted){
      notes.removeAt(index);
      notifyListeners();
    }
    return ProcessResponse(
        massege: deleted ? 'note deleted succefully' : 'field',
        success: deleted);

  }
}
