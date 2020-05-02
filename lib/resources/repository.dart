import '../models/post.dart';
import 'post_api_provoder.dart';

class Repository {
  PostApiProvider apiProvider = PostApiProvider();

  Post fetchItem(int id) {
    var item = apiProvider.fetchItem(id);
    return item;
  }

  List<int> fetchPosts() {
    return apiProvider.fetchAllPosts();
  }

  void deletePost(int id) {
    apiProvider.deletePost(id);
  }

  addPost(Post post) {
    return apiProvider.addPost(post);
  }

  updatePost(Post post) {
    return apiProvider.updatePost(post);
  }

  int getId() {
    return apiProvider.getId();
  }

  int getItemId1(int index) {
    return apiProvider.getItemId1(index);
  }
}
