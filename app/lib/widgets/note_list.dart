import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/note_prov.dart';

class NoteList extends StatefulWidget {
  const NoteList({super.key});

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  Color invert(Color color) {
    final r = 255 - color.red;
    final g = 255 - color.green;
    final b = 255 - color.blue;

    return Color.fromARGB((color.opacity * 255).round(), r, g, b);
  }

  String subConverter(String sub) {
    if (sub.length > 20) {
      return "${sub.substring(0, 19)}...";
    } else if (sub.isEmpty) {
      return "This note is empty";
    } else {
      return sub;
    }
  }

  @override
  Widget build(BuildContext context) {
    final note = Provider.of<NoteProvider>(context);
    final data = note.notes;
    return FutureBuilder(
      future: note.fetchNotesData(),
      builder: (context, snapshot) => ListView.builder(
        itemBuilder: ((context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  tileColor: data[index].colors,
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  leading: CircleAvatar(
                    backgroundColor: invert(data[index].colors),
                    child: Text(data[index].title[0]),
                  ),
                  title: Text(subConverter(data[index].title)),
                  subtitle: Text(subConverter(data[index].content)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          note.deleteNote(data[index].id);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.pushNamed(context, '/edit',
                              arguments: [data[index].id, true]);
                        },
                      ),
                    ],
                  )),
            )),
        itemCount: data.length,
      ),
    );
  }
}
