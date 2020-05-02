import 'package:flutter/material.dart';

class comment {
  int id;
  String text;
  DateTime time;
  int Commentlikes;
  List<comment> listComment;

  comment(
      {@required this.id,
      @required this.text,
      @required this.time,
      @required this.listComment,
      @required this.Commentlikes});
}
