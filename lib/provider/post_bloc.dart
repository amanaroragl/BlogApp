import 'package:rxdart/rxdart.dart';

import '../models/post.dart';
import '../resources/repository.dart';

class PostBloc {
  final _repository = Repository();
  final _post = PublishSubject<List<int>>();
  final _itemsFetcher = PublishSubject<int>();
  final _itemsOutput = BehaviorSubject<Map<int, Post>>();

  PostBloc() {
    _itemsFetcher.stream.transform(_itemsTransformer()).pipe(_itemsOutput);
  }

// getters to streams
  Observable<List<int>> get post => _post.stream;
  Observable<Map<int, Post>> get items => _itemsOutput.stream;

// getters to sinks
  Function(int) get fetchItem => _itemsFetcher.sink.add;
  List<int> fetchPosts() {
    return _repository.fetchPosts();
    //_post.sink.add(allPosts.entries.map((entry) => entry.key).toList());
  }

  Post fetchItemPost(int id) {
    return _repository.fetchItem(id);
  }

  Post fetchItemPost1(int id) {
    return _repository.fetchItem(id);
  }

  addPosts(Post post) {
    _repository.addPost(post);
    //_post.sink.add(allPosts);
  }

  updatePosts(Post post) {
    _repository.updatePost(post);
    //_post.sink.add(allPosts);
  }

  Post fetchPost(int id) {
    return _repository.fetchItem(id);
  }

  void deletePostIndex(int index) {
    return _repository.deletePost(index);
  }

  int getId() {
    return _repository.getId();
  }

  int getItemId1(int index) {
    return _repository.getItemId1(index);
  }

  _itemsTransformer() {
    return ScanStreamTransformer((Map<int, Post> cache, int id, _) {
      Post item = _repository.fetchItem(id);
      cache[id] = item;
      return cache;
    }, Map<int, Post>());
  }

  dispose() {
    _post.close();
    _itemsFetcher.close();
    _itemsOutput.close();
  }
}
