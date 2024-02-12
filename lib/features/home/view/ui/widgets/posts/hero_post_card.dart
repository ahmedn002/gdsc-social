import 'package:flutter/material.dart';
import 'package:gdsc_social/features/home/domain/entities/post_entity.dart';
import 'package:gdsc_social/features/home/view/ui/widgets/posts/post_card.dart';

class HeroPostCard extends StatelessWidget {
  final PostEntity post;
  const HeroPostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: post.postId,
      child: PostCard(post: post),
    );
  }
}
