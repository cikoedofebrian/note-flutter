import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  final String longsubtitle =
      'This is a long ass subtitle which should have been cutted into some pieces';

  @override
  Widget build(BuildContext context) {
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
                        tileColor: Colors.green,
                        textColor: Colors.white,
                        iconColor: Colors.white,
                        leading: const CircleAvatar(
                          child: Text('A'),
                        ),
                        title: const Text('List Tile 1'),
                        subtitle: Text(longsubtitle.length > 25
                            ? "${longsubtitle.substring(0, 25)}..."
                            : longsubtitle),
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
                                    .then((value) => print(value));
                              },
                            ),
                          ],
                        )),
                  )),
              itemCount: 10,
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 70,
        height: 70,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/edit');
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
