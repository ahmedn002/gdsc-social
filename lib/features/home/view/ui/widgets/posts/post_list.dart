import 'package:flutter/material.dart';
import 'package:gdsc_social/features/home/view/ui/widgets/posts/post_card.dart';

import '../../../../domain/entities/post_entity.dart';

class PostList extends StatelessWidget {
  final List<PostEntity> posts;
  const PostList({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final PostEntity post = posts[index];
        return PostCard(post: post);
      },
    );
  }
}
