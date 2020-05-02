import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterblogapp/models/post.dart';
import 'package:flutterblogapp/provider/post_provider.dart';

class AddPostList extends StatefulWidget {
  @override
  AddPost createState() {
    return new AddPost();
  }
}

class AddPost extends State<AddPostList> {
  PostBloc bloc;
  Post post;
  String tittle;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    bloc = PostProvider.of(context);
    post = ModalRoute.of(context).settings.arguments;
    if (post == null) {
      tittle = "Add Post";
    } else {
      tittle = "Edit Post";
    }
    return PostProvider(
        child: Scaffold(
            appBar: AppBar(
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text(tittle),
              centerTitle: true,
            ),
            body: addPostScreen()));
  }

  Widget addPostScreen() {
    if (post == null) {
      return SingleChildScrollView(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                  controller: _controller,
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  decoration: InputDecoration(
                      labelText: 'Enter Post Title',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder()))),
          Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                  controller: _controllerText,
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  decoration: InputDecoration(
                      labelText: 'enter Post Text',
                      border: OutlineInputBorder(),
                      alignLabelWithHint: true))),
          RaisedButton(
            textColor: Colors.white,
            color: Colors.blue,
            onPressed: submitPost,
            child: Text('submit',
                style: TextStyle(fontSize: 20, decorationColor: Colors.blue)),
          )
        ],
      )));
    } else {
      _controller.text = post.tittle;
      _controllerText.text = post.text;
      return SingleChildScrollView(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                  controller: _controller,
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  decoration: InputDecoration(
                      labelText: 'Enter Post Title',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder()))),
          Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                  controller: _controllerText,
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  decoration: InputDecoration(
                      labelText: 'enter Post Text',
                      border: OutlineInputBorder(),
                      alignLabelWithHint: true))),
          RaisedButton(
            textColor: Colors.white,
            color: Colors.blue,
            onPressed: submitPost,
            child: Text('submit',
                style: TextStyle(
                  fontSize: 20,
                )),
          )
        ],
      )));
    }
  }

  final _controller = TextEditingController();
  final _controllerText = TextEditingController();
  void initState() {
    super.initState();
  }

  submitPost() {
    if (post == null) {
      setState(() {
        bloc.addPosts(new Post(
            id: UniqueKey().hashCode,
            tittle: _controller.text.toString(),
            text: _controllerText.text.toString(),
            postDate: DateTime.now()));
      });
    } else {
      setState(() {
        bloc.updatePosts(new Post(
            id: post.id,
            tittle: _controller.text.toString(),
            text: _controllerText.text.toString(),
            postDate: DateTime.now()));
      });
    }

    Navigator.pop(context);
  }

  void dispose() {
    _controllerText.dispose();
    _controller.dispose();

    super.dispose();
  }
}
