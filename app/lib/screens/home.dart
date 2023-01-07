import 'package:app/widgets/new_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/note_prov.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  final String longsubtitle =
      'This is a long ass subtitle which should have been cutted into some pieces';

  Color invert(Color color) {
    final r = 255 - color.red;
    final g = 255 - color.green;
    final b = 255 - color.blue;

    return Color.fromARGB((color.opacity * 255).round(), r, g, b);
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<NoteProvider>(context).notes;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Notec'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: ((context, index) => Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
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
                        title: Text(data[index].title),
                        subtitle: Text(data[index].content.length > 22
                            ? "${data[index].content.substring(0, 22)}..."
                            : data[index].content),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Navigator.pushNamed(context, '/edit')
                                    .then((value) => null);
                              },
                            ),
                          ],
                        )),
                  )),
              itemCount: data.length,
            ),
          ),
        ],
      ),
      floatingActionButton: NewForm(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
