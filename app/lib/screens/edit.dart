import 'package:app/widgets/color_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/note_prov.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  final _textController = TextEditingController();
  Color appbarcolor = Colors.deepOrange;

  @override
  void initState() {
    super.initState();
  }

  void appbarColor(Color color) {
    setState(() {
      appbarcolor = color;
    });
  }

  Future<void> showInformation(String title, DateTime date) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Information', textAlign: TextAlign.start),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Text("Title"), Text(title)],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Date created"),
                      Text(DateFormat('dd-MM-yyyy').format(date))
                    ],
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Exit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments as List<Object>;
    var title = '';
    bool edit = false;
    if (data.length > 1) {
      var note = Provider.of<NoteProvider>(context, listen: false)
          .findById(data[0] as String);
      edit = data[1] as bool;
      title = note.title;
      _textController.text = note.content;
    } else {
      title = data[0] as String;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: appbarcolor,
        actions: [
          edit
              ? IconButton(
                  onPressed: () {
                    var note = Provider.of<NoteProvider>(context, listen: false)
                        .findById(data[0] as String);
                    showInformation(note.title, note.date);
                  },
                  icon: const Icon(Icons.info_outline_rounded))
              : const SizedBox(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                if (edit) {
                  Provider.of<NoteProvider>(context, listen: false)
                      .updateNote(data[0] as String, _textController.text);
                  Navigator.pop(context);
                } else {
                  Provider.of<NoteProvider>(context, listen: false)
                      .addNote(title, _textController.text, appbarcolor);
                  Navigator.pop(context);
                }
              },
              icon: const Icon(Icons.check),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          ColorPicker(
            appbarcolor: appbarColor,
          ),
          Expanded(
            child: Container(
              // height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: TextField(
                controller: _textController,
                maxLines: null,
                textCapitalization: TextCapitalization.sentences,
                decoration: null,
                style: const TextStyle(
                  fontSize: 19,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
