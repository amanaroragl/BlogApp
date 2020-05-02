import 'package:flutter/material.dart';
import 'package:flutterblogapp/models/post.dart';
import 'package:flutterblogapp/provider/post_provider.dart';

class PostDetailScreen extends StatefulWidget {
  @override
  PostDetail createState() {
    return new PostDetail();
  }
}

class PostDetail extends State<PostDetailScreen> {
  PostBloc bloc;
  Post post;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    bloc = PostProvider.of(context);
    post = ModalRoute.of(context).settings.arguments;
    _controllerText.text = post.tittle.toString();
    _controller.text = post.text.toString();
    return PostProvider(
        child: Scaffold(
            appBar: AppBar(
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text("Post Detail"),
              centerTitle: true,
            ),
            body: addPostDetailScreen()));
  }

  Widget addPostDetailScreen() {
    return new Container(
        child: SingleChildScrollView(
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
                enabled: false,
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
                enabled: false,
                decoration: InputDecoration(
                    labelText: 'enter Post Text',
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true))),
//        ListView.builder(
//            shrinkWrap: true,
//            physics: const NeverScrollableScrollPhysics(),
//            itemCount: bloc.fetchPosts() == null ? 0 : bloc.fetchPosts().length,
//            itemBuilder: (context, int index) {
//              return Dismissible(
//                key: ObjectKey(UniqueKey()),
//                child: Container(
//                  padding: EdgeInsets.all(20.0),
//                  child: PostListCard(
//                    itemId: bloc.fetchItemPost(bloc.fetchPosts()[index]),
//                  ),
//                ),
//                onDismissed: (direction) {
//                  //To delete
//                  setState(() {
//                    bloc.deletePostIndex(bloc.getItemId1(index));
//                  });
//
//                  //To show a snackbar with the UNDO button
//                  Scaffold.of(context).showSnackBar(SnackBar(
//                    content: Text("Item deleted"),
//                  ));
//                },
//              );
//            }),
      ],
    )));
  }

  final _controller = TextEditingController();
  final _controllerText = TextEditingController();
  void initState() {
    super.initState();
  }

  submitPost() {
    setState(() {
      bloc.addPosts(new Post(
          id: UniqueKey().hashCode,
          tittle: _controller.text.toString(),
          text: _controllerText.text.toString(),
          postDate: DateTime.now()));
    });

    Navigator.pop(context);
  }

  void dispose() {
    _controllerText.dispose();
    _controller.dispose();

    super.dispose();
  }
}
