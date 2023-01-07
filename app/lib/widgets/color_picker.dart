import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.appbarcolor});
  final Function appbarcolor;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  List<Color> colors = [
    Colors.deepOrange,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.grey,
    Colors.black,
    Colors.orange,
    Colors.amber,
    Colors.pink,
    Colors.purple,
  ];
  Color? choosenColor = Colors.deepOrange;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: InkWell(
              child: CircleAvatar(
                  backgroundColor: colors[index],
                  foregroundColor: Colors.white,
                  child: choosenColor == colors[index]
                      ? Icon(Icons.circle)
                      : null),
              onTap: () {
                choosenColor = colors[index];
                widget.appbarcolor(colors[index]);
              },
            )),
        itemCount: colors.length,
      ),
    );
  }
}
