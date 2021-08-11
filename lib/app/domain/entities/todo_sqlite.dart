import 'package:flutter/cupertino.dart';

class Todo {
  dynamic id;
  DateTime createdTime;
  String title;
  String description;
  bool isDone;

  Todo({
    this.id,
    @required this.createdTime,
    @required this.title,
    this.description = '',
    this.isDone = false,
  });
}
