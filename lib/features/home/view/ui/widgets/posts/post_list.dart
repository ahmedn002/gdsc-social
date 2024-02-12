import 'package:flutter/material.dart';
import 'package:gdsc_social/core/extensions/num_to_sized_box.dart';
import 'package:gdsc_social/features/home/view/ui/widgets/posts/hero_post_card.dart';

import '../../../../domain/entities/post_entity.dart';

class PostList extends StatelessWidget {
  final List<PostEntity> posts;
  const PostList({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final PostEntity post = posts[index];
        return HeroPostCard(post: post);
      },
      separatorBuilder: (context, index) => 16.vs,
    );
  }
}
