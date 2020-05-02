import 'package:flutter/material.dart';

import '../provider/post_bloc.dart';

export 'post_bloc.dart';

class PostProvider extends InheritedWidget {
  final PostBloc postBloc;
  PostProvider({Key key, Widget child})
      : postBloc = PostBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static PostBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(PostProvider) as PostProvider)
        .postBloc;
  }
}
