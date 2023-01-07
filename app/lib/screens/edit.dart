import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context, _textController.text);
              },
              icon: Icon(Icons.check))
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: _textController,
          )
        ],
      ),
    );
  }
}
