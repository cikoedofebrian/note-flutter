import 'package:flutter/material.dart';
import '../models/note.dart';

class NoteProvider with ChangeNotifier {
  final List<Note> _notes = [];

  List<Note> get notes {
    return _notes;
  }

  void addNote(String ntitle, String nsubtitle, Color ncolors) {
    final newNote = Note(
        id: DateTime.now().toString(),
        title: ntitle,
        colors: ncolors,
        date: DateTime.now(),
        content: nsubtitle);
    _notes.add(newNote);
    notifyListeners();
  }

  void deleteNote(String id) {
    _notes.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  Note findById(String id) {
    var notes = _notes.firstWhere((element) => element.id == id);
    return notes;
  }

  void updateNote(String id, String content) {
    var index = _notes.indexWhere((element) => element.id == id);
    _notes[index].content = content;
  }
}
