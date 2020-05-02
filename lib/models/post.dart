import 'package:flutter/material.dart';

class Post {
  String tittle;
  String text;
  DateTime postDate;
  // List<comment> commentList;

  int id;

  Post({
    @required this.id,
    @required this.tittle,
    @required this.text,
    @required this.postDate,
  });
}
