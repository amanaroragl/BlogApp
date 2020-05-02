import 'package:flutter/material.dart';

import '../widgets/loading_container.dart';

class LoadingPostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, _) {
          return LoadingContainer();
        });
  }
}
