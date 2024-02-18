import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gdsc_social/core/extensions/num_to_sized_box.dart';
import 'package:gdsc_social/features/home/view/ui/widgets/posts/hero_post_card.dart';

import '../../../../domain/entities/post_entity.dart';

class PostList extends StatefulWidget {
  final List<PostEntity> posts;
  const PostList({super.key, required this.posts});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  num delay = 200;
  Duration animationDuration = 2.seconds;

  @override
  void initState() {
    Future.delayed(3.seconds, () {
      if (mounted) {
        setState(() {
          delay = 0;
          animationDuration = 0.seconds;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      addAutomaticKeepAlives: true,
      itemCount: widget.posts.length,
      itemBuilder: (context, index) {
        final PostEntity post = widget.posts[index];
        return HeroPostCard(post: post)
            .animate()
            .then(delay: (index * delay).ms)
            .slideX(curve: Curves.easeOutExpo, duration: animationDuration)
            .fade(curve: Curves.easeOutExpo, duration: animationDuration);
      },
      separatorBuilder: (context, index) => 16.vs,
    );
  }
}
