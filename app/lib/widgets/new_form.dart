import 'package:flutter/material.dart';

class NewForm extends StatefulWidget {
  const NewForm({super.key});

  @override
  State<NewForm> createState() => _NewFormState();
}

class _NewFormState extends State<NewForm> {
  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();

    return Container(
      width: 70,
      height: 70,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                content: Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('New Notes', textAlign: TextAlign.start),
                      TextField(
                        controller: textController,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel'),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (textController.text.isEmpty) {
                                  return;
                                }
                                Navigator.pop(context);
                                Navigator.pushNamed(context, '/edit',
                                    arguments: textController.text);
                              },
                              child: Text('Continue'))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
