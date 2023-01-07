import 'package:flutter/material.dart';

class Note {
  String id;
  String title;
  String content;
  DateTime date;
  Color colors;

  Note({
    required this.id,
    required this.title,
    required this.colors,
    required this.date,
    required this.content,
  });
}
