import 'package:flutterblogapp/models/post.dart';

import '../models/post.dart';

class PostApiProvider {
  Map<int, Post> _allPostIds = new Map<int, Post>();
  int id = 0;

  static final PostApiProvider _singleton =
      PostApiProvider._privateConstructor();

  factory PostApiProvider() {
    return _singleton;
  }
  updatePost(Post post) {
    _allPostIds.update(post.id, (v) => post);
  }

  void deletePost(int key) {
    _allPostIds.remove(key);
  }

  PostApiProvider._privateConstructor();

  Post fetchItem(int id) {
    return _allPostIds[id];
  }

  int getId() {
    return this.id++;
  }

  int getItemId1(int index) {
    return _allPostIds.entries.elementAt(index).key;
  }

  List<int> fetchAllPosts() {
    return _allPostIds.entries.map((event) => event.key).toList();
  }

  List<String> addPost(Post post) {
    _allPostIds[post.id] = post;

    ;
  }
}
