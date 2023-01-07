import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../models/note.dart';

class NoteProvider with ChangeNotifier {
  List<Note> _notes = [];

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
}
