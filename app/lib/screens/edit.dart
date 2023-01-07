import 'package:app/widgets/color_picker.dart';
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

  void appbarColor(Color color) {
    setState(() {
      appbarcolor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    var title = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: title == null ? Text('Edit') : Text(title as String),
        backgroundColor: appbarcolor != null ? appbarcolor : null,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.info_outline_rounded)),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                Provider.of<NoteProvider>(context, listen: false).addNote(
                    title as String, _textController.text, appbarcolor);
                Navigator.pop(context, _textController.text);
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
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: TextField(
                controller: _textController,
                maxLines: null,
                textCapitalization: TextCapitalization.sentences,
                decoration: null,
                style: TextStyle(
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
