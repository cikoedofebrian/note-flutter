import 'package:app/helpers/db_helper.dart';
import 'package:flutter/material.dart';
import '../models/note.dart';

class NoteProvider with ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes {
    return _notes;
  }

  void addNote(String ntitle, String nsubtitle, Color ncolors) {
    DBHelper.insert({
      'id': DateTime.now().toString(),
      'date': DateTime.now().toIso8601String(),
      'title': ntitle,
      'content': nsubtitle,
      'color': ncolors.value
    });
    notifyListeners();
  }

  void deleteNote(String id) {
    DBHelper.delete(id);
    notifyListeners();
  }

  Note findById(String id) {
    var notes = _notes.firstWhere((element) => element.id == id);
    return notes;
  }

  void updateNote(String id, String content) {
    DBHelper.update(id, content);
    notifyListeners();
  }

  Future<void> fetchNotesData() async {
    final data = await DBHelper.getData();
    _notes = data
        .map((e) => Note(
            id: e['id'],
            title: e['title'],
            colors: Color(e['color']),
            date: DateTime.parse(e['date']),
            content: e['content']))
        .toList();
    notifyListeners();
  }
}
