import 'package:app/widgets/new_form.dart';
import 'package:app/widgets/note_list.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Notec'),
      ),
      body: Column(
        children: const [
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: NoteList(),
          ),
        ],
      ),
      floatingActionButton: const NewForm(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
