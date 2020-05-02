import 'package:flutter/material.dart';
import 'package:flutterblogapp/screen/add_post_screen.dart';

import '../models/post.dart';

class PostListCard extends StatelessWidget {
  final Post itemId;

  PostListCard({this.itemId});

  Widget build(context) {
    return buildCard(context, itemId);
  }

  Widget buildCard(BuildContext context, Post item) {
    return Column(children: <Widget>[
      Container(height: 4),
      Card(
          elevation: 3,
          child: ListTile(
            trailing: new Column(
              children: <Widget>[
                new Container(
                  child: new IconButton(
                    icon: new Icon(Icons.note_add),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddPostList(),
                              // Pass the arguments as part of the RouteSettings. The
                              // DetailScreen reads the arguments from these settings.
                              settings: RouteSettings(
                                arguments: itemId,
                              )));
                    },
                  ),
                )
              ],
            ),
            title: Text('${item.tittle}'),
            subtitle: Text('${item.text}'),
          )),
      Container(height: 4)
    ]);
  }
}
